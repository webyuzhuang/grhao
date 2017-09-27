package com.fz.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by zhuang on 2017-09-21.
 */
public class Jiami {
    public static String pwd(String password,String account){
        String str = password+account;
        //第一种加密
        StringBuilder s = md(str,"md5");
        //第二种加密
        s.append(md5(str,"sha1"));
        //第三种加密
        s.append(md5(str,"sha"));
        //将这三种都依次截取然后添加到StringBuilder可变字符串中，设置长度为32位
        StringBuilder passwd = new StringBuilder(32);
        passwd.append(s.substring(0, 5));
        passwd.append(s.substring(20, 25));
        passwd.append(s.substring(30, 38));
        passwd.append(s.substring(40, 50));
        passwd.append(s.substring(50, 54));
        return passwd.toString();
    }

    public static StringBuilder md(String str,String type) {
        StringBuilder s = new StringBuilder(32);
        try {
            MessageDigest md = MessageDigest.getInstance(type);
            //str.getBytes()字符串转变为字符数组
            //update(byte[] input) 使用指定的 byte 数组更新摘要。
            md.update(str.getBytes());
            //md.digest()是他生成的密文，然后加到stringBuilder可变字符串
            // byte[]类型	digest()  通过执行诸如填充之类的最终操作完成哈希计算。
            for(byte b : md.digest()){
                //%x十六进制数的意思   密文字母最多到f，因为是十六进制数
                s.append(String.format("%x",b));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return s;
    }
    //这个方法是为了让其不同的加密形式，生成密文，然后在main方法中进行截取
    public static String md5(String str,String type) {
        return md(str,type).toString();
    }
}
