<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>哇！购-网上水果商城-水果网购首选平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="去哇！购,网上水果商城,水果网购平台,进口水果,精品水果,水果套餐,水果礼盒,家庭健康水果套餐,家庭订制,企业福利" />
    <meta http-equiv="description" content="哇！购是国内领先的网上水果购物平台，以新鲜、健康为前提，精选国内外时鲜水果，24小时新鲜速达，方便快捷、品质保障、贴心服务，让你足不出户即可享世界鲜果！" />
    <meta charset="UTF-8" />
    <link href="../css/bothends.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="../css/style-new.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="../js/jquery1.42.min.js"></script>
    <script src="../js/jquery.SuperSlide.2.1.1.js"></script>
    <style>
    /* css 重置 */
		*{margin:0; padding:0; list-style:none; }
		body{ background:#fff; font:normal 12px/22px 宋体;  }
		img{ border:0;  }
		a{ text-decoration:none; color:#333;  }

		/* 本例子css */
		.slideBox{ width:1190px; height:380px; overflow:hidden; position:relative; border:1px solid #ddd;  }
		.slideBox .hd{ height:15px; overflow:hidden; position:absolute; right:505px; bottom:0px; z-index:1; }
		.slideBox .hd ul{ overflow:hidden; zoom:1; float:left;  }
		.slideBox .hd ul li{ float:left; margin-left:10px;  width:15px; height:15px; line-height:14px; text-align:center; background:#fff; cursor:pointer; }
		.slideBox .hd ul li.on{ background:#f00; color:#fff; }
		.slideBox .bd{ position:relative; height:100%; z-index:0;   }
		.slideBox .bd li{ zoom:1; vertical-align:middle; }
		.slideBox .bd img{ width:1190px; height:380px; display:block;margin-left:75px;}

		/* 下面是前/后按钮代码，如果不需要删除即可 */
		.slideBox .prev,
		.slideBox .next{ position:absolute; left:30%; top:50%; margin-top:-25px; display:block; width:32px; height:40px; background:url(img/slider-arrow.png) -110px 5px no-repeat; filter:alpha(opacity=50);opacity:0.5;   }
		.slideBox .next{ left:auto; right:3%; background-position:8px 5px; }
		.slideBox .prev:hover,
		.slideBox .next:hover{ filter:alpha(opacity=100);opacity:1;  }
		.slideBox .prevStop{ display:none;  }
		.slideBox .nextStop{ display:none;  }
    </style>
    <script >
    $(function(){
		$(".slideBox").slide({
			mainCell:".bd ul",
			titCell:'.hd ul',
			autoPage:true,
			autoPlay:true
		});
	})	
    </script>
</head>
<body>
<div class="top" id="#top">
    <div class="top1">
        <div class="top1-box clearfix">
            <ul class="ul1">
                <li>
                    <b class="he-home"></b>
                    <a href="index.jsp">回到首页</a>
                </li>
                <li>
                    <span>欢迎来哇！购</span>
                </li>
                <li>
                    <%=session.getAttribute("lu")!=null?"<a href=\"Logouts\">注销</a>&nbsp;<a href=\"login.html\">重新登录</a>":"<a href=\"Logouts\">请先登录</a>"%>
                </li>
                <li>
                    <a href="register.html">免费注册</a>
                </li>
            </ul>
            <ul class="ul2">
                <li>&nbsp;&nbsp;
                    <b class="colorb81c22">客服电话：400-0650-159</b>
                </li>
                <li>
                    <b class="he-carts"></b>
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                   <a href="shopping_car.jsp" id="cart-num1">购物车<span style="color:red;font-size:14px;font-weight:bold"><%=session.getAttribute("scarsize")!=null?(session.getAttribute("scarsize")).toString():"0"%></span>件</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">购物车<span style="color:red;font-size:14px;font-weight:bold"><%=session.getAttribute("scarsize")!=null?(session.getAttribute("scarsize")).toString():"0"%></span>件</a>
                	 <% }%>

                </li>
                <li>
                    <a href="my-order.jsp">
                    <%=session.getAttribute("lu")!=null?"<span style=\"color:red\">"+(((Map)session.getAttribute("lu")).get("uname")).toString()+"的个人中心"+"</span>":"请先登录"%><img src="../img/001.png"></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="center">
        <div class="top2 padtop">
            <div class="top2-1">
                <a href="index.html" title="哇！购">
                    <img src="../img/logo.png" width="100" alt="logo" style="float:left;">
                </a>
                <div class="dress" id="dress01">
                    <!--  -->
                    <div class="top-click-alert">
                        <img src="../img/dress.png">
                        <p>郑州市&nbsp;&nbsp;金水区</p>
                        <p>好商品来哇！购
                        <p>
                    </div>
                    <div id="mybg"></div>
                </div>
            </div>
            <div class="top2-2">
                <ul>
                    <li class="li1">
                          <form class="search" action="GetSearchInfo" onsubmit="" method="post">
                            <input type="text" name="search" class="ip1" value="" maxlength="24" placeholder="搜索" id="search_all_input">
                            <input type="submit" value="搜索" class="ip2">
                           </form>
                    </li>
                    <li class="li2">热门搜索&nbsp; &nbsp;
                        <a href="#">柚子</a>
                        <a href="#">牛油果</a>
                        <a href="#">橙</a>
                        <a href="#">奇异果</a>
                        <a href="#">芒果</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="navpst">
            <div id="menu">
                <ul class="menu">
                    <li>
                        <a href="index.jsp" class="backe9">
                            <span>首页</span>
                        </a>
                    </li>
                    <li>
                        <a href="Categoryshop?action=all" class="backe9">
                            <span>全部商品<b></b></span>
                        </a>
                        <div>
                            <ul class="quan">
                                <li>
                                    <a href="Categoryshop?action=all" class="quan-bg">
                                        <span class="bgon">鲜果专区</span>
                                    </a>
                                    <div class="div1" style="display: block; background-image: url(../img/20141222100425.jpg);">
                                        <ul>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>进口鲜果</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>国内精品</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>营养套餐</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div></li>
                                <li>
                                    <a href="Categoryshop?action=all" class="quan-bg">
                                        <span class="bgon">适应人群</span>
                                    </a>
                                    <div class="div1" style=" background-image: url(../img/20141222100425.jpg);">
                                        <ul>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>婴儿</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>儿童</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>孕妇</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>长辈</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>糖尿病</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>高血压</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>心血管</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>养颜族</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>瘦身族</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    </li>
                                <li>
                                    <a href="Categoryshop?action=all" class="quan-bg">
                                        <span class="bgon">价格范围</span>
                                    </a>
                                    <div class="div1" style=" background-image: url(../img/20141222100425.jpg);">
                                        <ul>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span><100元</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>100-200元</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>200-300元</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>300-400元</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>400-500元</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all"  >
                                                    <span>500元以上</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="Categoryshop?action=all" class="quan-bg">
                                        <span class="bgon">功能寓意</span>
                                    </a>
                                    <div class="div1" style=" background-image: url(../img/20141222100425.jpg);">
                                        <ul>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>早日康复</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>结婚庆典</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>企业福利</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>节日吉祥</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>送礼亲朋</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="Categoryshop?action=all" class="quan-bg">
                                        <span class="bgon">重量范围</span>
                                    </a>
                                    <div class="div1" style=" background-image: url(../img/20141222101153.jpg);">
                                        <ul>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span><2.5KG</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>2.5-5KG</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>5-10KG</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="Categoryshop?action=all">
                                                    <span>>10KG</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div></li>
                            </ul>
                        </div></li>
                    <li>
                        <a href="Categoryshop?action=all" class="backe9">
                            <span>鲜果专区<b></b></span>
                        </a>
                        <div style="background-image: url(../img/20141222100425.jpg);">
                            <ul class="two">
                                <li>
                                    <a href="Categoryshop?action=all">
                                        <span>进口鲜果</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="Categoryshop?action=all">
                                        <span>国内精品</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="Categoryshop?action=all">
                                        <span>营养套餐</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li></li>
                    <li>
                        <a href="unfinished.jsp" class="backe9">
                            <span>礼品专区<b></b></span>
                        </a>
                        <div style="background-image: url(../img/20141222100425.jpg);">
                            <ul class="two">
                                <li>
                                    <a href="unfinished.jsp">
                                        <span>鲜果礼盒</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="unfinished.jsp">
                                        <span>鲜果礼篮</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="unfinished.jsp">
                                        <span>哇！购充值卡</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li id="family-hot">
                        <a href="unfinished.jsp" class="backe9">
                            <img src="../img/hot.gif">
                            <span>家庭套餐</span>
                        </a>
                    </li>
                    <li>
                        <a href="unfinished.jsp" class="backe9">
                            <span>企业采购</span>
                        </a>
                    </li>
                    <li>
                        <a href="unfinished.jsp" class="left">
                            <span>秒杀</span>
                        </a>
                    </li>
                    <li>
                        <a href="unfinished.jsp" class="left">
                            <span>预购</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--banner轮播 open-->
<div class="banner left">
    <div class="banner1">
        <p class="banner-right"> <a href="category.jsp" title="当期-巨峰葡萄超值特价" target="_blank"><img width="294" src="../img/jufeng.jpg" alt="当期-巨峰葡萄超值特价" /></a> </p>
    </div>
      <div id="slideBox" class="slideBox">
			<div class="hd"><ul></ul></div>
			<div class="bd">
				<%--<ul>
					<%
						DbUtil du = new DbUtil();
						List<Map<String,Object>> ads = du.query("advertising","*", "updown='d'","order by id desc");
						for(Map<String,Object> m : ads){
					%>
					<li><a href="" target="_blank"><img src="../upload/<%=m.get("advertisingupload") %>" /></a></li>
					<%
						}
					%>
				</ul>--%>
			</div>
		</div>
    
    <%-- <div id="slides" calss="slides">
    <div calss="bd"><ul></ul></di>
        <div class="slides_container t_c">
           <ul>
					<%
						DbUtil du = new DbUtil();
						List<Map<String,Object>> ads = du.query("advertising","*", "updown='d'","order by id desc");
						for(Map<String,Object> m : ads){
					%>
					<li><a href="" target="_blank"><img src="../upload/<%=m.get("advertisingupload") %>" /></a></li>
					<%
						}
					%>
				</ul>
        </div>
    </div>
</div> --%>
</div>
<!--banner轮播 end-->
<div style="width: 100%; height: 20px; float: left;">
    &nbsp;
</div>
<div class="middle clearfix">
    <!--果然超值 open-->
    <div class="grcz" style="background: url(../img/beijing.jpg);">
        <div class="grczleft clearfix">
            <ul>
                <li>
                    <a href="category.jsp" title="佳沛金奇异果特价" target="_blank">
                        <img src="../img/qiyiguo.jpg" alt="佳沛金奇异果特价" />
                    </a>
                </li>
                <!-- <p style="background: #;">点击购买</p> -->
            </ul>
            <ul>
                <li>
                    <a href="category.jsp" title="澳洲 无籽红提-新品特惠" target="_blank">
                        <img src="../img/tizi.jpg" alt="澳洲 无籽红提-新品特惠" />
                    </a>
                </li>
                <!-- <p style="background: #;">点击购买</p> -->
            </ul>
            <ul>
                <li>
                    <a href="category.jsp" title="泰国山竹1斤装-新品特惠" target="_blank">
                        <img src="../img/shanzhu.jpg" alt="泰国山竹1斤装-新品特惠" />
                    </a>
                </li>
                <!-- <p style="background: #;">点击购买</p> -->
            </ul>
        </div>
        <div class="grczright">
            <div id="banner">
                <ul>
                    <li class="on">1</li>
                </ul>
                <div id="banner_list">
                    <a href="category.jsp" title="仙居东魁杨梅特价超值购" target="_blank">
                        <img width="300" src="../img/yangmei.jpg" alt="仙居东魁杨梅特价超值购" />
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--果然超值 end-->
    <!--优惠专区 open-->
    <div style="width: 100%; height: 1px; margin-top: -50px; padding-bottom: 50px;" id="box1"></div>
    <div class="yhzq clearfix">
        <h3>
            <span onclick="">优惠专区</span>
            <a href="category.jsp" target="_blank">
                <!-- <img src="/img/yhzq-01.png"> -->
            </a>
        </h3>
        <div class="yhzq1">
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="越南红心火龙果（大果）1个装 约1.2斤">
                        <img class="lazy" src="../img/20160806153036.jpg" alt="越南红心火龙果（大果）1个装 约1.2斤" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="越南红心火龙果（大果）1个装 约1.2斤">
                        越南红心火龙果（大果）1个装 约1.2斤
                    </a>
                </li>
                <li class="li3">果肉细腻 甜而不腻</li>
                <li class="li4">￥13.90</li>
                <li class="li5">
                    <s>￥35.60</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                   <a href="../shoppingcar.action?gid=20">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="四川柠檬  1斤装">
                        <img class="lazy" src="../img/20160719183255.jpg" alt="四川柠檬  1斤装" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="四川柠檬  1斤装">
                        四川柠檬 1斤装
                    </a>
                </li>
                <li class="li3">
                    酸爽多汁 美容圣品
                </li>
                <li class="li4">￥11.90</li>
                <li class="li5">
                    <s>￥25.50</s>
                </li>
                <li class="li6">
                    <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=39">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="西州蜜瓜 1个装 约3-4斤">
                        <img class="lazy" src="../img/20160420095038.jpg" alt="西州蜜瓜 1个装 约3-4斤" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="西州蜜瓜 1个装 约3-4斤"> 西州蜜瓜 1个装 约3-4斤 </a>
                </li>
                <li class="li3">皮薄肉厚 甜美多汁</li>
                <li class="li4">￥19.90</li>
                <li class="li5">
                    <s>￥48.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=27">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="国产蓝莓  1盒装">
                        <img class="lazy" src="../img/20150429173821.jpg" alt="国产蓝莓  1盒装" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="国产蓝莓  1盒装">
                        国产蓝莓 1盒装
                    </a>
                </li>
                <li class="li3">
                    富含花青素 护眼小帮手
                </li>
                <li class="li4">
                    ￥7.50
                </li>
                <li class="li5">
                    <s>￥25.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                   <a href="../shoppingcar.action?gid=32">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
        </div>
    </div>
    <div style="width: 100%; height: 1px; margin-top: -50px; padding-bottom: 50px;" id="box2"></div>
    <div class="yhzq clearfix xpzq">
        <h3>
            <span onclick="">新品专区</span>
            <a href="" target="_blank"></a>
        </h3>
        <div class="yhzq1">
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="泰国椰青 1个装">
                        <img class="lazy" src="../img/20160517101823.jpg" alt="泰国椰青 1个装" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="泰国椰青 1个装">
                        泰国椰青 1个装
                    </a>
                </li>
                <li class="li3">营养丰富 香醇可口</li>
                <li class="li4">￥15.00</li>
                <li class="li5">
                    <s>￥21.00</s>
                </li>
                <li class="li6">
                    <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=23">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="云南蜜桔 孕妇水果 2斤装 ">
                        <img class="lazy" src="../img/20161224160620.jpg" alt="云南蜜桔 孕妇水果 2斤装 " />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="云南蜜桔 孕妇水果 2斤装 ">
                        云南蜜桔 孕妇水果 2斤装
                    </a>
                </li>
                <li class="li3">皮薄汁多 酸甜可口</li>
                <li class="li4">￥18.80</li>
                <li class="li5">
                    <s>￥32.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                   <a href="../shoppingcar.action?gid=30">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="小台农芒果 500g">
                        <img class="lazy" src="../img/20150603143050.jpg" alt="小台农芒果 500g" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="小台农芒果 500g">
                        小台农芒果 500g
                    </a>
                </li>
                <li class="li3">娇小玲珑 清甜嫩滑</li>
                <li class="li4">￥7.00</li>
                <li class="li5">
                    <s>￥20.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                   <a href="../shoppingcar.action?gid=40}">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="海南 香蕉 2斤装">
                        <img class="lazy" src="../img/20170304174041.jpg" alt="金黄蕉 香蕉 2斤装" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="海南 香蕉 2斤装">
                        金黄蕉 香蕉 2斤装
                    </a>
                </li>
                <li class="li3">果肉香甜 软糯顺滑</li>
                <li class="li4">￥6.90</li>
                <li class="li5">
                    <s>￥15.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=41">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
        </div>
    </div>
    <!--新品专区 end-->
    <!--热卖专区 open-->
    <div style="width: 100%; height: 1px; margin-top: -50px; padding-bottom: 50px;" id="box3"></div>
    <div class="yhzq clearfix rmzq">
        <h3>
            <span onclick="">热卖专区</span>
            <a href="" target="_blank"></a>
        </h3>
        <!--第一行-->
        <div class="yhzq1">
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="泰国椰青 1个装">
                        <img class="lazy" src="../img/20160517101823.jpg" alt="泰国椰青 1个装" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="泰国椰青 1个装">
                        泰国椰青 1个装
                    </a>
                </li>
                <li class="li3">营养丰富 香醇可口</li>
                <li class="li4">￥15.00</li>
                <li class="li5">
                    <s>￥21.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=23">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="云南蜜桔 孕妇水果 2斤装 ">
                        <img class="lazy" src="../img/20161224160620.jpg" alt="云南蜜桔 孕妇水果 2斤装 " />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="云南蜜桔 孕妇水果 2斤装 ">
                        云南蜜桔 孕妇水果 2斤装
                    </a>
                </li>
                <li class="li3">皮薄汁多 酸甜可口</li>
                <li class="li4">￥18.80</li>
                <li class="li5">
                    <s>￥32.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=30">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="小台农芒果 500g">
                        <img class="lazy" src="../img/20150603143050.jpg" alt="小台农芒果 500g" />
                    </a>
                </li>
                <li class="li2">
                    <a href="/goods/1443.htm" target="_blank" title="小台农芒果 500g">
                        小台农芒果 500g
                    </a>
                </li>
                <li class="li3">娇小玲珑 清甜嫩滑</li>
                <li class="li4">￥7.00</li>
                <li class="li5">
                    <s>￥20.00</s>
                </li>
                <li class="li6">
                     <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=40">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
            <ul>
                <li class="li1">
                    <a href="" target="_blank" title="海南香蕉 2斤装">
                        <img class="lazy" src="../img/20170304174041.jpg" alt="金黄蕉 香蕉 2斤装" />
                    </a>
                </li>
                <li class="li2">
                    <a href="" target="_blank" title="海南 香蕉 2斤装">
                        金黄蕉 香蕉 2斤装
                    </a>
                </li>
                <li class="li3">果肉香甜 软糯顺滑</li>
                <li class="li4">￥6.90</li>
                <li class="li5">
                    <s>￥15.00</s>
                </li>
                <li class="li6">
                    <span > 
                    <%if(session.getAttribute("lu")!=null){ 
                    	%>
                  <a href="../shoppingcar.action?gid=41">购物车</a>
                   <%  }else{
                	   %>
                	   <a href="login.html" id="cart-num1">加入购物车</a>
                	 <% }%>
                	 </span>
                </li>
            </ul>
        </div>
    </div>
    <!--热卖专区 end-->
</div>
<div class="bottom1 clearfix">
    <div class="bottom1-left">
        <h3>当我们谈论哇!购时，我们谈论些什么</h3>
        <div class="div">
            <ol></ol>
            <ul>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="159****2797">159***</span>对
                                <a href="" target="_blank" title="12月特惠小礼盒-鲜果礼盒二">
                                    12月特惠小
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="水果真的不错，实惠新鲜美味">
                                “水果真的不错，实惠新鲜美味”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2017-01-14 17:09:18
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="12月特惠小礼盒-鲜果礼盒二" target="_blank">
                                    <img class="lazy" src="../img/20161224093325.jpg" alt="12月特惠小礼盒-鲜果礼盒二" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="12月特惠小礼盒-鲜果礼盒二" target="_blank">
                                    12月特惠小礼盒-鲜果礼盒
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li>
                                <img src="img/yan.png" />
                            </li>
                            <li class="li1">
                                <span title="159****2797">159***</span>对
                                <a href="goods/1264.htm" target="_blank" title="广东香蕉 5斤装">
                                    广东香蕉 5
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="香蕉很新鲜，口感也不错。">
                                “香蕉很新鲜，口感也不错。”
                            </li>
                            <li class="li3">
                                <img src="/img/san1.png" />
                                <img src="/img/san1.png" />
                                <img src="/img/san1.png" />
                                <img src="/img/san1.png" />
                                <img src="/img/san1.png" />
                                2016-12-25 16:21:43
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="广东香蕉 5斤装" target="_blank">
                                    <img class="lazy" src="img/20161224160411.jpg" alt="广东香蕉 5斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="广东香蕉 5斤装" target="_blank">广东香蕉 5斤装</a>
                            </li>
                        </ul>
                    </div> </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="159****2797">159***</span>对
                                <a href="" target="_blank" title="越南白心小果5个装 约2000g">
                                    越南白心小果
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="白心火龙果挺好吃的，买了发福利真正好。">
                                “白心火龙果挺好吃的，买了发福利真正好。”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-12-25 16:21:43
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="越南白心小果5个装 约2000g" target="_blank">
                                    <img class="lazy" src="../img/20161224163839.jpg" alt="越南白心小果5个装 约2000g" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="越南白心小果5个装 约2000g" target="_blank">
                                    越南白心小果5个装 约20
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="img/yan.png" /></li>
                            <li class="li1">
                                <span title="159****2797">159***</span>对
                                <a href="" target="_blank" title="云南圣女果 250g">
                                    云南圣女果
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="同事们都爱吃...">
                                “同事们都爱吃...”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-12-25 16:21:43
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="云南圣女果 250g" target="_blank">
                                    <img class="lazy" src="../img/20160719184629.jpg" alt="云南圣女果 250g" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="云南圣女果 250g" target="_blank">
                                    云南圣女果 250g
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="159****2797">159***</span>对
                                <a href="" target="_blank" title="涌泉蜜桔5斤装">
                                    涌泉蜜桔5斤
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="桔子真的很甜。。。">
                                “桔子真的很甜。。。”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-12-25 16:13:37
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="涌泉蜜桔5斤装" target="_blank">
                                    <img class="lazy" src="img/20151113135243.jpg" alt="涌泉蜜桔5斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="涌泉蜜桔5斤装" target="_blank">
                                    涌泉蜜桔5斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li>
                                <img src="img/yan.png" />
                            </li>
                            <li class="li1">
                                <span title="笑哥">笑哥</span>对
                                <a href="" target="_blank" title="新疆马奶提 2斤装">
                                    新疆马奶提
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">“”</li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-12-14 22:22:30</li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="新疆马奶提 2斤装" target="_blank">
                                    <img class="lazy" src="img/20150428173904.jpg" alt="新疆马奶提 2斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="新疆马奶提 2斤装" target="_blank">
                                    新疆马奶提 2斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="笑哥">
                                    笑哥
                                </span>对
                                <a href="" target="_blank" title="阳山水蜜桃 5斤装">
                                    阳山水蜜桃
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">“”</li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-12-14 22:22:29
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="阳山水蜜桃 5斤装" target="_blank">
                                    <img class="lazy" src="img/20150707153858.jpg" alt="阳山水蜜桃 5斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="阳山水蜜桃 5斤装" target="_blank">
                                    阳山水蜜桃 5斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li>
                                <img src="img/yan.png" />
                            </li>
                            <li class="li1">
                                <span title="笑哥">笑哥</span>对
                                <a href="" target="_blank" title="海南麒麟瓜B  1个装">
                                    海南麒麟瓜B
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">“”</li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-12-14 22:22:29
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="海南麒麟瓜B  1个装" target="_blank">
                                    <img class="lazy" src="../img/20160719091246.jpg" alt="海南麒麟瓜B  1个装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="海南麒麟瓜B  1个装" target="_blank">
                                    海南麒麟瓜B 1个装
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="181****6664">181***</span>对
                                <a href="" target="_blank" title="海南小台农芒果 4斤装">
                                    海南小台农芒
                                </a>这样说:
                            </li>
                            <li class="li2" title="">“”</li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-11-22 09:37:50
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="海南小台农芒果 4斤装" target="_blank">
                                    <img class="lazy" src="img/20160318141415.jpg" alt="海南小台农芒果 4斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="海南小台农芒果 4斤装" target="_blank">
                                    海南小台农芒果 4斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="img/yan.png" /></li>
                            <li class="li1">
                                <span title="wuhudafei">wuhuda</span>对
                                <a href="" target="_blank" title="上海麒麟瓜 1个装-特价秒杀">
                                    上海麒麟瓜
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="so good">
                                “so good”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san2.png" />
                                <img src="../img/san2.png" />
                                <img src="../img/san2.png" />
                                <img src="../img/san2.png" />
                                2016-11-01 10:29:49
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="上海麒麟瓜 1个装-特价秒杀" target="_blank">
                                    <img class="lazy" src="../img/20160719091246.jpg" alt="上海麒麟瓜 1个装-特价秒杀" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="上海麒麟瓜 1个装-特价秒杀" target="_blank">
                                    上海麒麟瓜 1个装-特价秒
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="喜杨杨">喜杨杨</span>对
                                <a href="" target="_blank" title="鲜果礼盒88元A套餐">
                                    鲜果礼盒88
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="搭配非常不错的礼盒，挺新鲜的">
                                “搭配非常不错的礼盒，挺新鲜的”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-09-13 15:58:22
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="鲜果礼盒88元A套餐" target="_blank">
                                    <img class="lazy" src="img/20160909153528.jpg" alt="鲜果礼盒88元A套餐" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="鲜果礼盒88元A套餐" target="_blank">
                                    鲜果礼盒88元A套餐
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="img/yan.png" /></li>
                            <li class="li1"><span title="喜杨杨">喜杨杨</span>对
                                <a href="" target="_blank" title="新疆86王哈密瓜 1个装">
                                    新疆86王哈
                                </a>这样说:
                            </li>
                            <li class="li2" title="很甜，也比较新鲜">
                                “很甜，也比较新鲜”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-09-12 11:01:39
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="新疆86王哈密瓜 1个装" target="_blank">
                                    <img class="lazy" src="../img/20160730175312.jpg" alt="新疆86王哈密瓜 1个装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="新疆86王哈密瓜 1个装" target="_blank">
                                    新疆86王哈密瓜 1个装
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="喜杨杨">喜杨杨</span>对
                                <a href="" target="_blank" title="菲律宾香蕉 5斤装">
                                    菲律宾香蕉
                                </a>这样说:
                            </li>
                            <li class="li2" title="很甜糯，非常不错的香蕉">
                                “很甜糯，非常不错的香蕉”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-09-12 11:01:39
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="菲律宾香蕉 5斤装" target="_blank">
                                   <img class="lazy" src="../img/20160311130203.png" alt="菲律宾香蕉 5斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="菲律宾香蕉 5斤装" target="_blank">
                                    菲律宾香蕉 5斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="../img/yan.png" /></li>
                            <li class="li1">
                                <span title="喜杨杨">喜杨杨</span>对
                                <a href="" target="_blank" title="鲜果礼盒118元花好月圆">
                                    鲜果礼盒11
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="很新鲜">
                                “很新鲜”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-09-12 10:57:37
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="鲜果礼盒118元花好月圆" target="_blank">
                                    <img class="lazy" src="../img/20160909161428.jpg" alt="鲜果礼盒118元花好月圆" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="鲜果礼盒118元花好月圆" target="_blank">
                                    鲜果礼盒118元花好月圆
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="150****9577">150***</span>对
                                <a href="" target="_blank" title="陕西黄心猕核桃 10个装">
                                    陕西黄心猕核
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="不错">
                                “不错”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-08-18 14:54:15</li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="陕西黄心猕核桃 10个装" target="_blank">
                                    <img class="lazy" src="../img/20151229164556.jpg" alt="陕西黄心猕核桃 10个装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="陕西黄心猕核桃 10个装" target="_blank">
                                    陕西黄心猕核桃 10个装
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="../img/yan.png" /></li>
                            <li class="li1">
                                <span title="139****9378">139***</span>对
                                <a href="" target="_blank" title="陕西黑布林 5斤装">
                                    陕西黑布林
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">“我们的水果真是好”</li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-08-09 15:14:24
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="陕西黑布林 5斤装" target="_blank">
                                    <img class="lazy" src="../img/20160719171728.jpg" alt="陕西黑布林 5斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="陕西黑布林 5斤装" target="_blank">
                                    陕西黑布林 5斤装
                                </a>
                            </li>
                        </ul>
                    </div> </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"></li>
                            <li class="li1">
                                <span title="139****9378">139***</span>对
                                <a href="" target="_blank" title="西州蜜瓜1个装 约4斤">
                                    西州蜜瓜1个
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">“蜜瓜真甜”</li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-08-09 15:14:23
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="西州蜜瓜1个装 约4斤" target="_blank">
                                    <img class="lazy" src="../img/20160420095038.jpg" alt="西州蜜瓜1个装 约4斤" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="西州蜜瓜1个装 约4斤" target="_blank">
                                    西州蜜瓜1个装 约4斤
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="../img/yan.png" /></li>
                            <li class="li1">
                                <span title="139****9378">139***</span>对
                                <a href="" target="_blank" title="山东黄桃 5斤装">
                                    山东黄桃 5
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">
                                “黄桃真便宜”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-08-09 15:14:23
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="山东黄桃 5斤装" target="_blank">
                                    <img class="lazy" src="../img/20160719095129.jpg" alt="山东黄桃 5斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="山东黄桃 5斤装" target="_blank">
                                    山东黄桃 5斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="active libox">
                    <div class="box1">
                        <ul class="ul1">
                            <li class="he-yan"><img src="../img/xiaoxi.png" /></li>
                            <li class="li1">
                                <span title="喜杨杨">喜杨杨</span>对
                                <a href="" target="_blank" title="海南小台农芒果 4斤装">海南小台农芒</a>这样说:
                            </li>
                            <li class="li2" title="非常不错">
                                “非常不错”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-08-02 16:45:16
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="海南小台农芒果 4斤装" target="_blank">
                                    <img class="lazy" src="../img/mg.jpg" alt="海南小台农芒果 4斤装" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="海南小台农芒果 4斤装" target="_blank">
                                    海南小台农芒果 4斤装
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="box1">
                        <ul class="ul1">
                            <li><img src="../img/xiaoxi.png" /></li>
                            <li class="li1">
                                <span title="139****9378">139***</span>对
                                <a href="" target="_blank" title="奉化水蜜桃（大果）5斤">
                                    奉化水蜜桃（
                                </a>
                                这样说:
                            </li>
                            <li class="li2" title="">
                                “甜甜蜜蜜”
                            </li>
                            <li class="li3">
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                <img src="../img/san1.png" />
                                2016-07-29 16:59:28
                            </li>
                        </ul>
                        <ul class="ul2">
                            <li>
                                <a href="" title="奉化水蜜桃（大果）5斤" target="_blank">
                                    <img class="lazy" src="../img/tz.jpg" alt="奉化水蜜桃（大果）5斤" />
                                </a>
                            </li>
                            <li>
                                <a href="" title="奉化水蜜桃（大果）5斤" target="_blank">
                                    奉化水蜜桃（大果）5斤
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="bottom1-right">
        <h3>果园公告</h3>
        <ul>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=22" title="2017中秋节后正常营业" target="_blank">
                    2017中秋节后正常营业
                </a>
            </li>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=21" title="2017年中秋节商城服务通知" target="_blank">
                    2017年中秋节商城服务通知
                </a>
            </li>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=20" title="满69包邮通告" target="_blank">
                    满69包邮通告
                </a>
            </li>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=19" title="哇!购强势归来，嗨购全场" target="_blank">
                    哇!购强势归来，嗨购全场
                </a>
            </li>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=18" title="哇!购商城系统维护" target="_blank">
                    哇!购商城系统维护
                </a>
            </li>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=17" title="中秋节发货通知" target="_blank">
                    中秋节发货通知
                </a>
            </li>
            <li>
                ●
                <a href="/noticeinfo/show.do?noticeInfo.id=15" title="家庭套餐可以自己更换水果啦！" target="_blank">
                    家庭套餐可以自己更换水果啦！
                </a>
            </li>
            <li class="li1">
                <a href="/notice/list.htm" target="_blank">
                    更多》
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="bottom">
    <div class="bottom2 clearfix">
        <div class="bottom2-left">
            <div>
                <h3 class="nav-bt1"><b></b>新手指南</h3>
                <ul>
                    <li>
                        <a target="_blank" href="#">
                            账户注册
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            购物流程
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            订购方式
                        </a>
                    </li>
                </ul>
            </div>
            <div>
                <h3 class="nav-bt2"><b></b>付款方式</h3>
                <ul>
                    <li>
                        <a target="_blank" href="#">
                            支付方式
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            充值说明
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            优惠券说明
                        </a>
                    </li>
                </ul>
            </div>
            <div>
                <h3 class="nav-bt3">
                    <b></b>配送方式
                </h3>
                <ul>
                    <li>
                        <a  target="_blank" href="#">
                            配送运费
                        </a>
                    </li>
                    <li>
                        <a  target="_blank" href="#">
                            配送范围
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            配送时间
                        </a>
                    </li>
                </ul>
            </div>
            <div>
                <h3 class="nav-bt4">
                    <b></b>售后服务
                </h3>
                <ul>
                    <li>
                        <a target="_blank" href="#">
                            退款说明
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            退换货政策
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            退换货流程
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            常见问题
                        </a>
                    </li>
                </ul>
            </div>
            <div style="width: 125px;">
                <h3 class="nav-bt5">
                    <b></b>关于我们
                </h3>
                <ul>
                    <li>
                        <a target="_blank" href="#">
                            公司介绍
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            联系我们
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            业务合作
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="#">
                            友情链接
                        </a>
                    </li>
                </ul>
            </div>
            <p class="p1"></p>
        </div>
        <div class="bottom2-right">
            <ul>
                <li class="li1">
                    <img src="../img/f-weixin.png">
                    <img src="../img/f-sina.png">
                </li>
                <li class="weibo-follow"></li>
            </ul>
        </div>
    </div>
    <div class="footer">
        <p>所有图片均受著作权保护，未经许可任何单位与个人不得使用、复制、转载、摘编，违者必究法律责任</p>
        <p>
            <a target="_blank" href="#">豫ICP备13029432号</a>
            | Copyright©2013-2017 <a target="_blank" href="www.wago.com">郑州哇购信息科技有限公司</a>
            版权所有
        </p>
        <div style="width:300px;margin:0 auto; padding:0px 0;">
            <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010802006092"
               style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">
                <img src="../img/gab.png" style="float:left;" />
                <p style="float:left;height:20px;line-height:20px;margin: 0px 0px0px 5px; color:#939393;">
                    豫公网安备 33010802006092号
                </p>
            </a>
        </div>
        <div class="">
            <a href="#">
                <img src="../img/bs1.jpg">
            </a>
            <a href="#">
                <img src="../img/bs2.png">
            </a>
            <a href="#">
                <img src="../img/bs3.png">
            </a>
            <a href="#">
                <img src="../img/bs4.png">
            </a>
        </div>
    </div>
</div>
</div>
</body>
</html>