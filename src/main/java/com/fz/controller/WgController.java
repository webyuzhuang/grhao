package com.fz.controller;

import com.fz.mapper.UserDoMapper;
import com.fz.model.UserDo;
import com.fz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

/**
 * Created by zhuang on 2017-09-19.
 */
@Controller
public class WgController {
    @Autowired
    private UserService bdao;
//下面这两个是用来测试用的，查询所有
    @RequestMapping("/aa")
    public String aa(Model m){
        m.addAttribute("wg",bdao.queryall());
        return "background/index";
    }
    @RequestMapping("/bb")
    public ModelAndView aa(){
        ModelAndView m=new ModelAndView();
        m.addObject("wg",bdao.queryall());
        m.setViewName("background/index");
        return m;
    }
//跳转到注册页面
    @RequestMapping("/register")
    public String zhuce(){
        return "frontdesk/register";
    }

    //这个是为了判断数据库是否有这个名字
    @RequestMapping("/registerservlet")
    public void count(HttpServletRequest req, HttpServletResponse resp,String yhm) throws IOException {
       req.setCharacterEncoding("utf-8");
       resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        UserDo u=new UserDo();
        u.setName(yhm);
        int i=bdao.querycount(u);
        System.out.println(i);
        if (i>0){
            out.print(yhm+":已经存在");
        }else{
            out.print(yhm+":无人使用");
        }
    }
//判断验证码是否正确
@RequestMapping("/yanzhengma")
    public void yanzm(HttpServletRequest req, HttpServletResponse resp,String yzm) throws IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        String n=yzm;
        HttpSession session=req.getSession();
        String yz=session.getAttribute("codestr").toString();
        if(n.length()==4){
            if(n.equalsIgnoreCase(yz)){
                out.print("验证码正确");
            }else{
                out.print("验证码错误，看不清可以换一张哦");
            }
        }else if (n.length()>4){
            out.print("验证码长度过长");
        }else if (n.length()<4){
            out.print("四位哦");
        }
    }

    //由于注册和登录页面的验证码id不一样，担心影响样式，所以写了两个控制器，不必惊慌
    @RequestMapping(value = "/yanzm",method = RequestMethod.POST)
    public void dl(HttpServletRequest req, HttpServletResponse resp,String code) throws IOException {
        System.out.println(code);
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        HttpSession session=req.getSession();
        String yzm=session.getAttribute("codestr").toString();
        if (code.length()==4){
            if (yzm.equalsIgnoreCase(code)){
                out.print("验证码正确");
            }else{
                out.print("验证码错误，看不清可以换一张哦");
            }
        }else if (code.length()>4){
            out.print("验证码错误，看不清可以换一张哦");
        }
    }

    //注册提交到这里zhuche
    @RequestMapping(value = "/zhuche.do",method = RequestMethod.POST)
    public ModelAndView zc(HttpServletRequest req, HttpServletResponse resp,String name,String tel,String password) throws IOException {
        resp.setContentType("text/html;charset=utf-8");
        System.out.println(name+tel+password);
        Jiami jia=new Jiami();
        String mima=jia.pwd(name,password);
        UserDo user =new UserDo();
        user.setName(name);
        user.setTel(tel);
        user.setPass(mima);
        int i=bdao.save(user);
        ModelAndView m=new ModelAndView();
        if(i>0){
            System.out.println("客户注册成功");
            //m.setViewName("redirect:/aa");
            m.setViewName("redirect:/login.html");
        }else{
            System.out.println("客户注册失败");
        }
        return m;
    }

    //跳转到登录页面
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String denglu(HttpServletRequest req, HttpServletResponse resp, Model m,String name,String pass){
       //这里接值用的是利用参数，也可以用对象传值接值，对象的话，参数里面要写实体类的类名 User u
        //获取值u.getName()  u.getPass     (用此条件的前提就是必须name属性值保持一致)
        System.out.println(name+pass+"----------------");
        Jiami jia=new Jiami();
        String mima=jia.pwd(name,pass);
        UserDo u=new UserDo();
        u.setPass(mima);
       int i=bdao.querycount(u);
       System.out.println(i);
       String lujin=null;
        if(i>0){
            System.out.println("登录成功，跳转到首页");
            lujin="frontdesk/index";
        }else{
            System.out.println("密码错误，跳转到登录页面");
           // resp.setHeader("Refresh", "3;login.html"); 这种方法不可行
            lujin="redirect:/login.html";
        }
//        return "frontdesk/index";
        return lujin;
    }
}
