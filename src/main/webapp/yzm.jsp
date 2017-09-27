<%@page import="java.util.Random"%>
<%@page import="java.awt.Font"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="image/png; charset=utf-8" pageEncoding="utf-8"%>
<%
int w = 80;
int h = 30;
Random r = new Random();
BufferedImage i = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
Graphics g = i.getGraphics();
Color c = new Color(251,251,251,255);
g.setColor(c);
g.fillRect(0,0,w,h);


c = new Color(0,255,0,255);
g.setColor(c);
g.setFont(new Font("宋体",Font.BOLD,30));

String str = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
String text="";
for(int m=0;m<4;m++){
	String t = String.valueOf(str.charAt(r.nextInt(str.length()-1)));
	text+=t;
	int x = (m+1)*15;
	c = new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255),r.nextInt(100)+125);
	g.setColor(c);
	g.setFont(new Font("宋体",Font.BOLD,r.nextInt(10)+20));
    g.drawString(t, x, r.nextInt(11)+20);
}

session.setAttribute("codestr", text);

//添加干扰点
for(int m=0;m<=10;m++){
	int x = r.nextInt(w);
	int y = r.nextInt(h);
	int s1 = r.nextInt(20)+10;
	int s2 = r.nextInt(20)+10;
	c = new Color(r.nextInt(100),r.nextInt(100),r.nextInt(100),r.nextInt(100));
	g.setColor(c);
	if(r.nextBoolean()){
    	g.fillOval(x, y, s1, s2);
	}else{
		g.fillRect(x, y, s1, s2);
	}
}

//添加干扰线
for(int m=0;m<=2;m++){
	int x1 = r.nextInt(w);
	int x2 = r.nextInt(w);
	int y1 = r.nextInt(h);
	int y2 = r.nextInt(h);
	c = new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255),r.nextInt(255));
	g.setColor(c);
    g.drawLine(x1,y1,x2,y2);
}

ImageIO.write(i,"png",response.getOutputStream());

g.dispose();

out.clear();  
out = pageContext.pushBody();
%>