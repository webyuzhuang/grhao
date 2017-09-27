<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 禁止缓存 下  之间-->
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <!-- 禁止缓存 上  之间 -->
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <script type="text/javascript" src="js/jquery-validate/jquery-1.4.1.js"></script>
    <%--<script type="text/javascript" src="../../../js/jquery-validate/jquery.validate.js"></script>--%>
    <title>用户注册_哇！购</title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link href="../../../css/bothends.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../../../css/style-new.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../../../css/login.css" media="screen" rel="stylesheet" type="text/css">

    <style type="text/css">
        #email_kuang{
            display: none;
        }
    </style>
    <!-- 连接layer显示层插件 -->
    <script src="js/layer/layer.js"></script>
<script>
        bian1=false;
        bian2=false;
        bian3=false;
        bian4=false;
        bian5=false;
        bian6=false;
        //判断用户名是否正确
        $(function () {

//            //keyup键盘移除  blur是移焦事件
            $('#smsCode').keyup(function () {
                var zz = /^([\u4E00-\u9FA5]+|[A-Z]+)$/;
                if(zz.test($('#smsCode').val())){
                    var i=$(this);
                }else{
                    $('#ms').css("color","red");
                    $('#ms').html("不能为空且符合规范");
                }
           $.get('/registerservlet',{yhm:i.val()},function (d) {
               $('#ms').html(d);
               //保存按钮不让点这个功能好像不对
               if(d.indexOf('存在')!=-1){
                   $('#ms').css("color","red");
                   $('#im').prop('disabled',true);

               }else{
                   bian1=true;
                   $('#ms').css("color","green");
                   $('#im').prop('disabled',false)
               }
           }, 'text')
            })
            //判断验证码是否正确
           $('#ii2').keyup(function () {
               var i=$(this);
               $.post('/yanzhengma',{yzm:i.val()},function (d) {
                   $('#ad1').html(d);
                   if(d.indexOf('正确')!=-1){
                        $('#ad1').css("color","green");
                       bian2=true;
                   }else if(d.indexOf('四位')!=-1){
                       $('#ad1').css("color","blue");
                   }else {
                       $('#ad1').css("color","red");
                   }
               }, 'text')
           })
            //判断手机号是否正确
           $('#shoujihao').blur(function () {
               var i=$(this);
               var shouji=/^1[3|7|5|8]\d{9}$/;
               var te=i.val();
               if(shouji.test(te)){
                   $('#sj').css("color","green");
                   $('#sj').html("格式正确");
                   bian3=true;
               }else{
                   $('#sj').css("color","red");
                   $('#sj').html("格式有误")
               }
           });
            //判断密码是否正确
            $('#password').blur(function () {
                var i=$(this);
                var mima=/^^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
                var mi=i.val();
                if(mima.test(mi)){
                    bian4=true;
                    $('#mi').css("color","green");
                    $('#mi').html("格式正确");
                }else{
                    $('#mi').css("color","red");
                    $('#mi').html("格式错误");
                }
            })
            //判断确认密码是否正确
            $('#rpassword').blur(function () {
                var mima=$('#password').val();
                var qmima=$('#rpassword').val();
                if(mima==qmima){
                    bian5=true;
                    $('#qmima').css("color","green");
                    $('#qmima').html("一致");
                }else{
                    $('#qmima').css("color","red");
                    $('#qmima').html("不一致");
                }
            })
//
            //综合判断是否让其注册
            $('#im').click(function(){
                if($("#register_chkAgree").attr('checked')==true){
                    if(!(bian1&&bian2&&bian3&&bian4&&bian5)){
                        alert("信息输入有误或不完整，请核对后重新输入");
                        layer.msg('信息输入有误或不完整，请核对后重新输入',{icon:6,time:8000},$("#registerFrom").attr("action", "#"));

                    }
                }else{
                    alert("请查看协议后选中哦");
                    layer.msg('请查看协议后选中哦',{icon:6,time:8000},$("#registerFrom").attr("action", "#"));
                }
            });

        })


    </script>

</head>
<body>

<div style="width:1190px; height:108px; margin:0 auto; background: url(../../../img/logins-2.jpg) no-repeat;">
    <a href="/index.jsp" style="width:140px; height:108px; float:left;"></a>
</div>
<div class="login-mian-xb" style="background: url(../../../img/logins-bg.jpg);">
    <div class="login-boxtxt">

        <div class="login-show">
            <div class="kang">

                <div class="login-left" style="background: #fff;">
                    <h3 class="login-h3"><span>已经是哇！购用户？<a href="../../../login.html">立即登录</a></span>注册</h3>

                    <div class="login-kuang">
                        <!-- 表单￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥￥ -->
                        <form method="post" action="/zhuche.do"  id="registerFrom">
                            <ul>
                                <li class="text">用户名<sup class="surely">*</sup></li>
                                <li>
                                    <div class="login-left-input">
                                        <input type="text" class="input-one" name="name" id="smsCode" placeholder="请输入用户名"  style="width:220px;height: 22px"><span id="ms"></span>
                                    </div>
                                </li>
                                <li class="color9e1634" id="mobile_input"></li>

                                <li class="text">验证码<sup class="surely">*</sup></li>
                                <li>
                                        <td><input type="text" placeholder="请输入验证码" id="ii2" name="yzm" size="30" style="width:220px;height: 22px">
                                            <img src="../../../yzm.jsp" onclick="this.src='yzm.jsp?'+new Date()"><span id="ad1"></span></td>

                                </li>
                                <li class="color9e1634" id="code_input"></li>

                                <li>手机号<sup>*</sup></li>
                                <li>
                                    <div>
                                        <input type="text"  name="tel" id="shoujihao" placeholder="请输入手机号"  style="width:220px;height: 22px"><span id="sj"></span>
                                    </div>
                                </li>
                                <li class="color9e1634" id="smsCode_input"></li>
                                <li class="text">设置密码<sup class="surely">*</sup></li>
                                <li>
                                    <div class="login-left-input">
                                        <input type="password" class="input-one" id="password"
                                               name="password"  placeholder="请设置6位数以上的密码" style="width:220px;height: 22px"><span id="mi"></span>
                                    </div>
                                </li>
                                <li class="color9e1634" id="password_input" style="width:220px"></li>
                                <li class="text">确认密码<sup class="surely">*</sup></li>
                                <li>
                                    <div class="login-left-input">
                                        <input type="password" class="input-one" id="rpassword" name="repassword"
                                               onchange="checkRPassword(null,this);" placeholder="请再次输入密码" style="width:220px;height: 22px"><span id="qmima"></span>
                                    </div>
                                </li>
                                <li class="color9e1634" id="rpassword_input"></li>

                            </ul>
                            <div class="login-help">
                                <p class="help01">
                                    <input id="register_chkAgree" type="checkbox" name="register$chkAgree"  checked="checked" >
                                    <a style="color:#9e1634" target="_blank" href="http://help.wago.com/opencms/company_about_wago.htm">

                                        <!-- 										<input type="checkbox" id="agreement_selected" checked="checked" style="vertical-align: top;"> -->
                                        《哇!购用户协议》</a> <br>
                                    <input type="image" src="img/tongyi.jpg"  id="im" ><span id="xieyi"></span>
                                </p>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<%@include file="footer.jsp"%>

</body>
</html>
