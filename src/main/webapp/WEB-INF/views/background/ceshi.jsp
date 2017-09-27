<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Zhuang</title>
</head>
<body>
<h1>用户列表显示页面，后期可用于后台管理页面</h1>
    <table>
        <tr>
            ${wg}
        </tr>
    <tr>
        <td>用户id</td>
        <td>用户名</td>
        <td>用户密码</td>
        <td>用户邮箱</td>
        <td>用户电话</td>
        <td>基本操作</td>
    </tr>
    <tr>
        <td>${wg.id}</td>
        <td>${wg.name}</td>
        <td>${wg.pass}</td>
        <td>${wg.tel}</td>
        <td><a href="javascript:void(0)">删除用户</a></td>
    </tr>
    </table>


</body>
</html>