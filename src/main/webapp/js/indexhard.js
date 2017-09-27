/**首页js*/
var length,price,hasChange=false;
var ads_list =new Array();//ads
$(function(){
	//导航栏高亮
	var thisUrl = document.URL;
	var $a;
	var href = '';
	var nav = $('ul.menu>li');
	//约惠导航高亮
	if(-1 != thisUrl.indexOf('/secondkill/list.htm') || 
			-1 != thisUrl.indexOf('/pregoods/list.htm')){
		$('#yuehui').addClass('li1');
		nav = null;
	}
	if(nav){
		for(var i=0; i<nav.length; i++){
			$a = $(nav[i]).children('a:first-child');
			href = $a.attr('href');
			if(-1 != thisUrl.indexOf(href)){
				$a.addClass('li1');
			}
		}
	}
});

$(function(){	
   /* $('.dress h3').hover(function(){
            $(this).next().show();
            $(this).addClass('colorb81c22');
            $('.dress h3 b').addClass('b1');
        },function(){
            $('.dressbox').hide();
            $(this).removeClass('colorb81c22');
            $('.dress h3 b').removeClass('b1');
        }
    )
    $('.dressbox').hover(
        function(){
            $(this).show();
            $('.dress h3').addClass('colorb81c22');
            $('.dress h3 b').addClass('b1');
        },function(){
            $(this).hide();
            $('.dress h3').removeClass('colorb81c22');
            $('.dress h3 b').removeClass('b1');
        }
    )*/
});

$(function(){
    $('.quan-bg span').hover(function(){
        $(this).addClass('on');
    },function(){
        $(this).removeClass('on');
    });
});

$(function(){
    $('.menu .two a').hover(function(){
        $(this).addClass('on');
    },function(){
        $(this).removeClass('on');
    });
});

function openUserCenter(){
	if(isLogin){
		window.open('/cusercenter/useraccount/manageCenterNewline.htm');
	}
}

function showLoginBox(obj){
	var tmp = $('#minicart').offset().top;
	$('#loginbox').css('top', $(obj).offset().top-tmp);
	$('#loginbox').show();
}

//侧边栏特效
var isLogin = false;
var lock = false;
var isSlide = false;	//侧边栏是否展开
var divId = '';
var $panel = $('<div style="position:fixed;z-index:998;background:#666;height:100%;right:0;top:0;display:none;"></div>');
var $obj;
var $preObj;
var $preObjClone;
var objWidth = '';
var objHeight = '';

function slide(current, id){
	if(id=='rmb'){//我的资产需要登陆
		if(!isLogin){
			showLoginBox(current);
			return;
		}
	}
    $obj = $('#'+id);
    objWidth = $obj.width() + 'px';
    objHeight = $obj.height() + 'px';

    $('img.iii').hide();
    //展开情况下
    if(isSlide){
        //点击当前高亮，则收起侧边栏
        if(divId==id){
            $obj.animate({right: '-'+objWidth});
            $('#minicart').animate({right: '0'});

            $panel.animate({width: '0'},function(){//收起时同时收起特效背景
                $panel.hide();
            });
            $(".minicat-right > p:first-child").animate({opacity:'0'}, function(){
            	$(".minicat-right > p:first-child").css('cursor', 'default');
            });
            isSlide = false;
            
        }else{
        	//切换模块
            if(!lock){

                lock = true;//锁定
                $preObj = $('#'+divId);
                $preObjClone = $preObj.clone();
                $preObjClone.removeAttr('id');
                $preObjClone.css('opacity', '0.9');
                $preObjClone.css('top', '0');
                $preObj.hide();

                //菜单栏水平调整
                $('#minicart').css('right', objWidth);

                if('che2'==id){
                    $(current).addClass('bg_388b57');
                    $('.che').css('background', 'url(/img/cart/che1.png) #388b57 no-repeat 5px 16px');
                    $('.che').css('color', '#fff');
                    showCart();
                }else{
                	$('.che').removeClass('bg_388b57');
                	$('.che').removeAttr('style');
                	if('seeshop'==id){
                		$('.see1-box1 img').show();
                		historyGoods();
                	}else if('rmb'){
                		$('.rmb1-box1 img').show();
                		showAsset();
                	}
                }

                //添加特效背景
                $panel.width($obj.width());
                $panel.show();
                $obj.before($panel);
                $preObjClone.width($obj.width());
                $obj.before($preObjClone);

                //初始化位置到底部，准备上移
                $obj.css('right', '0');
                $obj.css('top', objHeight);
                $obj.show();


                //开始切换特效
                //上移
                $obj.animate({top: '0'},'slow');
                //下移
                $preObjClone.animate({top: objHeight,width: '0',right: '100px'},'slow',function(){
                    $preObjClone.remove();
                    $panel.hide();
                    lock = false;//解锁
                });

                divId = id;
                isSlide = true;
            }
        }
    } else { //未展开情况下
    	
        if ('che2'==id) {
        	//添加高亮
            $(current).addClass('bg_388b57');
            $('.che').css('background', 'url(/img/cart/che1.png) #388b57 no-repeat 5px 16px');
            $('.che').css('color', '#fff');
            showCart();
        } else {
        	if('seeshop'==id) {
        		$('.see1-box1 img').show();
        		historyGoods();
        	} else if('rmb') {
        		$('.rmb1-box1 img').show();
        		showAsset();
        	}
            $('.che').removeAttr('style');
        }
        $obj.css('right', '-'+objWidth);
        $obj.show();
        //展开
        $obj.animate({right: '0'});
        $('#minicart').animate({right: objWidth});
        $(".minicat-right > p:first-child").animate({opacity:'1'}, function(){
        	$(".minicat-right > p:first-child").css('cursor', 'pointer');
        });
        
        divId = id;
        
        isSlide = true;
    }
}

function closeSidebar(){
	
    $obj.animate({right: '-'+objWidth});
    $('#minicart').animate({right: '0'});
    $panel.animate({width: '0'},function(){//收起时同时收起特效背景
        $panel.hide();
    });
    $(".minicat-right > p:first-child").animate({opacity:'0'}, function(){
    	$(".minicat-right > p:first-child").css('cursor', 'default');
    	$('img.iii').hide();
    	$('.che').removeClass('bg_388b57');
    	$('.che').removeAttr('style');
    });
    isSlide = false;
}

function checkLogin(obj, hintId){
	if(obj.value.match(/^.+$/)){
		$('#'+hintId).css('visibility', 'hidden');
	}
}

function formLogin(){
	var loginUrl = '/cuser/login.action';
	var account = $('#lgn-account').val();
	var password = $('#lgn-password').val(); 
	var code = $('#lgn-code').val(); 
	var params = $('#loginform').serialize();
		
	if (account == null || account == '') {
		$('#hint-account').html('请输入账号');
		$('#hint-account').css('visibility', 'visible');
		return;
	}
	if (password == null || password == '') {
		$('#hint-pwd').html('请输入密码');
		$('#hint-pwd').css('visibility', 'visible');
		return;
	}
	if (code == null || code == '') {
		$('#hint-code').html('请输入验证码');
		$('#hint-code').css('visibility', 'visible');
		return;
	}
	
	$('.logining').html('正在登录 . . .');
	loginUrl = loginUrl +'?'+ params;
	
	$.getJSON(loginUrl, function(data){
		if('200'==data.statusCode){
			$.post('/cuser/loginForSuc.action?'+params, function(){
				$('.logining').html('登录成功 ！');
				if(-1 < location.href.indexOf('logout')){
					location.href = "/index.htm";
				}else{
					location.reload();
				}
			});
		}else{
			$('.logining').html('登录');
			if('100'==data.statusCode){
				$('#hint-code').html('验证码错误');
				$('#hint-code').css('visibility', 'visible');
			}else if('300'==data.statusCode){
				$('#hint-account').html('账号不存在');
				$('#hint-account').css('visibility', 'visible');
			}else if('400'==data.statusCode){
				$('#hint-account').html('账号无法使用');
				$('#hint-account').css('visibility', 'visible');
			}else if('500'==data.statusCode){
				$('#hint-pwd').html('密码错误');
				$('#hint-pwd').css('visibility', 'visible');
			}else{
				alert('登录失败');
			}
		}
	});
	return false;
}


function showCart(){
	var cartUrl = "/shopcarinfo/readShoppingCartFromCookie.htm";
	$.getJSON(cartUrl, function(data){
		$('.che2-box1').empty();
		if(null==data || null==data.msginfo || 0==data.count){
			$('.che2-box2').show();
			$('#che2').children('h3').children('i').html('0');
			$('#che2').children('h3').children('span').html('00.00');
			$('#cart-num1').html('购物车0件');
			$('.che1').children('.che1-box3').html('0');
			$('#cas1').removeAttr('onclick');
			$('#cas1').addClass('cashover');
			return;
		}
		$('.che2-box2').hide();
		$('#cas1').attr('onclick', 'window.open("/shopcar/list.htm")');
		$('#cas1').removeClass('cashover');
		var items = data.msginfo;
		for(var i in items){
			var $ul = $("<ul></ul>");
			var $li1 = $("<li class='li1'><a href='/goods/"+items[i].id+".htm' target='_blank'><img src='/img_root/img_goods/"+items[i].id+"/"+items[i].goodsLogo+"' alt='"+items[i].goodsName+"'></a></li>");
			var $li2 = $("<li class='li2'><a href='/goods/"+items[i].id+".htm' title='"+items[i].goodsName+"' target='_blank'>"+items[i].goodsName+"</a><img src='/img/cart/che2-1.png' onclick='removeItem("+items[i].id+")'></li>");
			var $li3 = $("<li class='li3'><img src='/img/cart/che2-2.png' onclick='changeNum(this,"+items[i].id+",-1)'> "+items[i].num+" <img src='/img/cart/che2-3.png' onclick='changeNum(this,"+items[i].id+",1)'> <span>"+items[i].goodAllPrice+"</span></li>");
			$ul.append($li1).append($li2).append($li3);
			$('.che2-box1').append($ul);
		}
		$('#che2').children('h3').children('i').html(data.count);
		$('#che2').children('h3').children('span').html(data.allPirce);
		$('#cart-num1').html('购物车'+data.count+'件');
		$('.che1').children('.che1-box3').html(data.count);
	});
}

function removeItem(goodsid) {
	$.post("/shopcarinfo/removeAllCookie.htm", {
		goodsid : goodsid
	}, function(data) {
		var result = eval('(' + data + ')');
		if (result['statusCode'] == '8000' && result['statusStr'] == 'ok') {
			showCart();
		}
	});
}

function changeNum(obj, goodsId, num) {
	$.post("/shopcarinfo/addToShoppingCart.htm",
		{
			goodsid : goodsId,
			num : num
		},function(){
			showCart();
	});
}


//浏览记录
function historyGoods(){
	var hisGoods = $.parseJSON($.cookie('goodsList'));
	$('.seeshop-box').empty();
	for(var i in hisGoods){
		//只显示最新8条浏览历史
		if(i>=(hisGoods.length-8)){
			var $ul = $("<ul></ul>");
			var $li1 = $("<li class='li1'><a href='/goods/"+hisGoods[i].goodsId+".htm' target='_blank'><img src='/img_root/img_goods/"+hisGoods[i].goodsId+"/"+hisGoods[i].goodsLogo+"' alt='"+hisGoods[i].goodsName+"'></a></li>");
			var $li2 = $("<li class='li2'><a href='/goods/"+hisGoods[i].goodsId+".htm' title='"+hisGoods[i].goodsName+"' target='_blank'>"+hisGoods[i].goodsName+"</a></li>");
			var $li3 = $("<li class='li3'><s>￥"+hisGoods[i].nomalPrice+"</s><b class='colae1f24'>￥"+hisGoods[i].nowPrice+"</b></li>");
			$ul.append($li1).append($li2).append($li3);
			$('.seeshop-box').prepend($ul);
		}
	}
}

//我的资产
function showAsset(){
	if(isLogin){
		$('#noCoupon1').show();
		$('#noCoupon2').show();
		$('#noCoupon3').show();
		$('#div-cp1').empty();
		$('#div-cp2').empty();
		$('#div-cp3').empty();
		$.getJSON("/cusercenter/useraccount/assetAjax.action",function(asset){
			if(null!=asset && 'null'!=asset){
				$('#s-balance').html(asset.account.systemMoney);
				$('#s-score').html(asset.account.score);
				$('#s-couponNum').html(asset.couponNum);
				var coupons = asset.couponList;
				var canCoupons = asset.canCouponList;
				
				for(var i in canCoupons){
					var $ul = $("<ul class='ul2 ul4'></ul>");
					var $li1 = $("<li class='li1'>"+canCoupons[i].couponMoney+"</li>");
					var $li2 = $("<li class='li2'>有效期<br />"+canCoupons[i].realDays+"天</li>");
					//可领取
					var $li3 = $("<li class='li3' onclick='getCoupons("+canCoupons[i].id+");'>点击领取</li>");
					
					if(99 < canCoupons[i].couponMoney){
						$li1.addClass('sanwei');
					}
					$ul.append($li1).append($li2).append($li3);
					
						$('#noCoupon3').hide();
						$('#div-cp3').append($ul);
				}
				
				
				for(var i in coupons){
					var $ul = $("<ul class='ul2'></ul>");
					var $li1 = $("<li class='li1'>"+coupons[i].couponMoney+"</li>");
					var $li2 = $("<li class='li2'>有效期<br />"+coupons[i].activeTime.substring(0,10)+"<br>"+coupons[i].endTime.substring(0,10)+"</li>");
					var $li3 = $("<li class='li3'>满"+coupons[i].leastOrderMoney+"使用</li>");
					
					if(99 < coupons[i].couponMoney){
						$li1.addClass('sanwei');
					}
					$ul.append($li1).append($li2).append($li3);
					
					if(1==coupons[i].status){//可使用
						$('#noCoupon1').hide();
						$('#div-cp1').append($ul);
					}else{//最近使用
						var useTime = coupons[i].useTime;
						if(''!=useTime){
							var today = new Date();
							//只显示30天内使用的优惠券
							if(today.getTime() - Date.parse(useTime.replace(/\-/g,'/')) <= 1000*60*60*24*30){
								$('#noCoupon2').hide();
								$ul.addClass('ul3');
								$('#div-cp2').append($ul);
							}
						}
					}
				}
			}
		});
	}
}

//获取优惠劵
function getCoupons(id){
	$.getJSON("/cusercenter/useraccount/getCoupons.action?couponId="+id,function(couponId){
		showAsset();
	});
	
}

//秒杀机会
function showKillCount(){
	$.getJSON("/killcount/killCountNum.action",function(data){
		if(null!=data && 'null'!=data){
			$('#i-kill').html(data.count);
		}
	});
}


function addToCarShop1(obj, goodsId, num) {
	$.ajax({
		type : "POST",
		url : "/shopcarinfo/addToShoppingCart.htm",
		data : {
			goodsid : goodsId,
			num : num
		},
		dataType : "json",
		success : function(data) {
			var $number = $(obj).parent().find('.shop_number');
			var currentNum = $number.val();
			if (num == "1") {
				currentNum = parseInt(currentNum) + 1;
			} else {
				currentNum = parseInt(currentNum) - 1;
			}
			if (currentNum <= 0) {
				$number.val(1);
			} else {
				$number.val(currentNum);
			}
			var $number = $(obj).parent().find('.shop_number');
			$("#goodssize").empty();
			$("#goodssize").append(
					"您购物车中共" + length + "件商品<span class='cart_all'>合计：¥"
							+ changeTwoDecimal_f(data.allPirce) + "</span>");
			
			
			if ($(".shu_nu").length>0) {
				$(".shu_nu").empty();
				$(".shu_nu").append(data.count);
			}

		}
	});
	hasChange = true;
}

function inputCarShop(obj, goodsId) {
	var num=obj.value;
	$.ajax({
		type : "POST",
		url : "/shopcarinfo/addToShoppingCart2.htm",
		data : {
			goodsid : goodsId,
			num : num
		},
		dataType : "json",
		success : function(data) {
			var $number = $(obj).parent().find('.shop_number');
			var currentNum = num;
			
			$number.val(currentNum);
			
			var $number = $(obj).parent().find('.shop_number');
			$("#goodssize").empty();
			$("#goodssize").append(
					"您购物车中共" + length + "件商品<span class='cart_all'>合计：¥"
							+ changeTwoDecimal_f(data.allPirce) + "</span>");
			
			
			if ($(".shu_nu").length>0) {
				$(".shu_nu").empty();
				$(".shu_nu").append(data.count);
			}

		}
	});
	hasChange = true;
}

function addToCarShop(obj, goodsId, num) {
	flyImg(obj,goodsId, num);
}

function flyImg(obj,goodsId, num){
	var $carDiv = $('.che1-box2');
	var $obj = $(obj);
	var flyImg_name = undefined;
	
	if($obj.closest('ul').length<=0){
		var th = $('#thumblist');
		if(th.length>0){
			flyImg_name = th.find("li:first").find('a').find('img').attr('src');
		}
	} else {
		if($obj.closest('ul').length > 0 && $obj.closest('ul').find('img.lazy').length>0){
			flyImg_name = $obj.closest('ul').find('img.lazy').attr('data-original');
		} else if($obj.closest('ul').find('img').attr('src').length>0){
			flyImg_name = $obj.closest('ul').find('img').attr('src');
		} else {
			flyImg_name = "/images/bg_bay2.png";
		}
	}
	
	var flyImg;
	if($('.flyImg').length!=0){
		flyImg = $('.flyImg');
		flyImg.remove();
		flyImg = $('<img class="flyImg" src="'+flyImg_name+'" style="width:80px;height:80px;"> ');
		flyImg.show();
	}else{
		flyImg = $('<img class="flyImg" src="'+flyImg_name+'" style="width:80px;height:80px;"> ');
	}
	flyImg.css('position','absolute');
	flyImg.css('top',$obj.offset().top);
	flyImg.css('left',$obj.offset().left);
	$('body').append(flyImg);
	flyImg.animate({top:($carDiv.offset().top+40)+'px',left:($carDiv.offset().left-60)+'px'},500,function(){
		flyImg.hide();
		addToCarData(goodsId,num);
	});
}

function addToCarData(goodsId,num){
	$.ajax({
		type : "POST",
		url : "/shopcarinfo/addToShoppingCart.htm",
		data : {
			goodsid : goodsId,
			num : num
		},
		dataType : "json",
		success : function(data) {
			if ($("#cart-num1").length>0) {
				if(isSlide){
					showCart();
				} else {
					$('#cart-num1').html('购物车'+data.count+'件');
					$('.che1').children('.che1-box3').html(data.count);
				}
			}
		}
	});
	hasChange = true;
}

  // 检索
function gotosearch(obj) {
	var searchContentNew = $(obj).find('input').val();
	if (searchContentNew && $.trim(searchContentNew) != ""
			&& searchContentNew != preSearchContent) {
		$(obj).attr('action', '/search/' + searchContentNew + '.htm');
		$(obj).submit();
	}
}
function checkgotosearch(obj) {
	var searchContentNew = $(obj).find('input').val();
	if (searchContentNew && searchContentNew != ""
			&& searchContentNew != preSearchContent) {
		$(obj).attr('action', '/search/' + searchContentNew + '.htm');
		return true;
	} else {
		//go to all goods list page
		openLink('/goodsInfo/goodsAll.htm');
		return false;
	}
}



// js保留2位小数（强制）
function changeTwoDecimal_f(x) {
	var f_x = parseFloat(x);
	if (isNaN(f_x)) {
		return false;
	}
	var f_x = Math.round(x * 100) / 100;
	var s_x = f_x.toString();
	var pos_decimal = s_x.indexOf('.');
	if (pos_decimal < 0) {
		pos_decimal = s_x.length;
		s_x += '.';
	}
	while (s_x.length <= pos_decimal + 2) {
		s_x += '0';
	}
	return s_x;
}


//写城市cookie
function setCookieCity(obj) {
	var value = obj.attr("citycode");
	if (value == undefined) return;
	$.cookie("address", value);
	queryCity();
}

function queryCity(){
	var cookie_addrss = $.cookie("address");
	if(cookie_addrss != undefined && cookie_addrss != ""){
		
		$.ajax({
			type : "post",
			url : "/businesscity/getCityByCode.htm",
			dataType : "json",
			async : false,
			data : {
				cityCode:cookie_addrss
			},
			success : function(result) {
	            if(result['statusCode']=='8000'&&result['statusStr']=='no'){
	            	//$('#dress01').find('h3').text("杭州市");
	            	$('#dress01').find('h3').html("杭州市"+'<b></b>');
	        		$.cookie("address", "3301",{path:"/"});
	        		user_city = "杭州市";
	            }else{
	            	var str = result['statusStr'];
	            	$('#dress01').find('h3').html(str+'<b></b>');
	            	$.cookie("address", cookie_addrss,{path:"/"});
	            	user_city = str;
	            }
			}
		});
	} else {
		//$('#dress01').find('h3').text("杭州市");
		$('#dress01').find('h3').html("杭州市"+'<b></b>');
		$.cookie("address", "3301",{path:"/"});
		user_city = "杭州市";
	}
}

function getPort() {
	return window.location.port;
}
function getProtocol() {
	return window.location.protocol;
}
function getHostName() {
	return window.location.hostname;
}
/**
 * get project name
 * @returns
 */
function getProjectName() {
	var fullPath = window.document.location.href;
	var strPath = window.document.location.pathname;
	var pos = fullPath.indexOf(strPath);
	return strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
}
/**
 * http://localhost:8080/projectName
 * 
 * @returns {String}
 */
function getWebHost() {
	return this.getProtocol() + "//" + this.getHostName() + ":"
			+ this.getPort() + getProjectName();
}
/**
 * 页面回车事件处理
 */
function customKeyDown(e){
	var curKey = e.which;
	/**user login jsp*/
	if(curKey == 13){
		var $user_login = $('');
		/**user login div*/
		$user_login = $("#btn-login");
		var $login_box = $('div.login-box');
		if($login_box.length>0 && !$login_box.is(":hidden") && $user_login.length>0){
			$("#btn-login").click();
			return false;
		}
		/**sidebar login div*/
		$user_login = $('#loginbox');
		if($user_login.length>0 && !$user_login.is(":hidden")){
			$("div.logining").click();
			return false;
		}
		/**login jsp */
		$user_login = $("#user_login");
		if($user_login.length>0){
			$("#user_login").click();
			return false;
		}
		/**seach engine jsp*/
		var $search_all_input = $("#search_all_input");
		if($search_all_input.length>0){
			var searchContentNew = $search_all_input.val();
			if (searchContentNew && $.trim(searchContentNew) != ""
					&& searchContentNew != preSearchContent) {
				var $sub = $search_all_input.parent();
				$sub.attr('action', '/search/' + searchContentNew + '.htm');
				$sub.submit();
			} else {
				openLink('/goodsInfo/goodsAll.htm');
			}
			return false;
		} 
		return false;
	}
}
//加载事件
$(document).ready(function(){
	//初始化购物车数量
	if($('#cart-num1').length>0){
		var cartUrl = "/shopcarinfo/readShoppingCartFromCookie.htm";
		$.getJSON(cartUrl, function(data){
			$('#cart-num1').html('购物车'+data.count+'件');
			$('.che1').children('.che1-box3').html(data.count);
		});
	}
	
	//var topMain=$(".top").height()//是头部的高度加头部与nav导航之间的距离
    var nav=$("#navpst");
    $(window).scroll(function(){
        if ($(window).scrollTop()>133){//如果滚动条顶部的距离大于topMain则就nav导航就添加类.nav_scroll，否则就移除
            nav.addClass("topdh_scroll");
        }else{
            nav.removeClass("topdh_scroll");
        }
    });

    var maxwidth = document.body.clientHeight;
    $('.clientHeight').css('height',maxwidth);



    $('.name-tu').hover(function(){
            $('.bj').show();
        },function(){
            $('.bj').hide();
        }
    );

    /*最近浏览*/
    $('.see').hover(function(){
            $('.see1-box2').show();
        },function(){
            $('.see1-box2').hide();
        }
    );
    /*我的资产*/
    $('.rmb').hover(function(){
            $('.rmb1-box2').show();
        },function(){
            $('.rmb1-box2').hide();
        }
    );
    /*在线客服*/
    $('.liuyan').hover(function(){
            $('.liuyan1-box2').show();
            if($('#ib_img').length>0){
            	$('#ib_img').attr('src', '/img/cart/liuyan1.png');
            }
        },function(){
            $('.liuyan1-box2').hide();
            if($('#ib_img').length>0){
            	$('#ib_img').attr('src', '/img/cart/liuyan.png');
            }
        }
    );
    /*回到顶部*/
    $('.totop').hover(function(){
            $('.totop-box2').show();
        },function(){
            $('.totop-box2').hide();
        }
    );
    
    //侧边栏账户中心
    $('#usericon').hover(function(){
    	if(isLogin){
    		showKillCount();
    		$('#userinfo').show();
    	}else{
    		showLoginBox(this);
    	}
    },function(){
    	$('#userinfo').hide();
    	$('#loginbox').hide();
    });
    //添加移出消失
    $('#loginbox').hover(function(){
    	$('#loginbox').show();
    },function(){
    	$('#loginbox').hide();
    });

	//城市事件
	var $sendcity = $("#dress01").find("div.dressbox");
	var cookie_addrss = $.cookie("address");
	if(cookie_addrss ==null || cookie_addrss == undefined){
		cookie_addrss = "3301";
	}
	$sendcity.find('#'+cookie_addrss).addClass('on');
	
	$sendcity.find('a').each(function(){
		$(this).bind({
			click:function(){
				if($(this).attr("citycode")!=undefined){
					$sendcity.find('a').removeClass('on');
					setCookieCity($(this));
					$sendcity.find('#'+$(this).attr("citycode")).addClass('on');
				}
			}
		});
	});
	queryCity();
	//set choose center menu
	var $nav_left_menuorder = $('#nav_left_menu_order');
	if($nav_left_menuorder.length > 0) {
		$nav_left_menuorder.find("ul li").each(function(index){
			if($(this).find("a").attr("href") == window.document.location.pathname ||
					$(this).find("a").attr("other") == window.document.location.pathname
			){
				$(this).find("a").addClass("on");
			}
			
		});
	}
	
	
	$(document).keydown(function(e){
		customKeyDown(e);
	});
});
//common function
function openLink(url) {
	 if(url == 'back'){
       history.back(-1);
   }else if(url != ""){
       window.location.href = url;
   }
}
function home(){
	openLink("/index.htm");
}
/* 
用途：检查输入字符串是否只由汉字、字母、数字组成 
输入：
value：字符串 
返回：
如果通过验证返回true,否则返回false 

 */
function isChinaOrNumbOrLett(s) {//判断是否是汉字、字母、数字组成 
	var regu = "^[0-9a-zA-Z\u4e00-\u9fa5_-]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
		return true;
	} else {
		return false;
	}
}

/* 
用途：检查输入字符串是否只由汉字、字母组成 
输入： 
value：字符串 
返回： 
如果通过验证返回true,否则返回false 

 */
function isChinaOrLett(s) {//判断是否是汉字、字母组成 
	var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
		return true;
	} else {
		return false;
	}
}
/**
 * 首页用户自领取优惠券
 * @returns
 */
function receiveSortCoupon(sortNum){
	$.getJSON("/cusercenter/couponInfo/receiveSortCoupon.action?sortNum="+sortNum,function(asset){
		console.log(asset);
	});
}

//end of common function