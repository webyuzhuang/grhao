//
//import com.fz.controller.Jiami;
//import com.fz.dao.WgDAO;
//import com.fz.entity.User;
//import com.fz.mapper.UserMapper;
//import org.junit.Test;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
///**
// * Created by zhuang on 2017-09-19.
// */
//
//public class Demo {
//
//    @Test
//    public void aaaa(){
//        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//        WgDAO bdao=ctx.getBean("abc",WgDAO.class);
//        System.out.println(bdao);
//        int i=bdao.querymima("48293e9e93fd32ac58484b996b1a17f9");
//        System.out.println(i);
//    }
//
//    @Test
//    public void cc(){
//        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//        WgDAO bdao=ctx.getBean("abc",WgDAO.class);
//        System.out.println(bdao.queryall());
//
//    }
//
//    @Test
//    public void dd() {
//        String name="张三丰";
//        String pass="y12345";
//        Jiami jia=new Jiami();
//        String mima=jia.pwd(name,pass);
//        System.out.println("密文："+mima);
//        //48293e9e93fd32ac58484b996b1a17f9
//        //48293e9e93fd32ac58484b996b1a17f9
//        //644a64dfaad6326b132bd2a73d35cad9
//    }
//
//    @Test
//    public void ceshi(){
//        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper u=ctx.getBean(UserMapper.class);
//        User uu=u.selectByPrimaryKey(14l);
//        System.out.println(uu.getName());
//    }
//}
