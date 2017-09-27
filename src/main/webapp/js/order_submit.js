
$(document).ready(function(){
	bindli($('.hide_address'));
	copyFiveAdd();
	
});

/**
 * 复制5个地址
 */
function copyFiveAdd(){
	var $addressAll = $('.hide_address').clone();
	var $goalAddress = $('#checkout_info').find('ul.radio:first');//目标object
	$goalAddress.empty();
	var liSize = $addressAll.find('li').size();
	$addressAll.find('li').each(function(index){
		if(index<5)$goalAddress.append($(this));
		else return false;
	});
	if(liSize>5){
		$goalAddress.append('<a href="#this" onclick="copyAllAdd()">使用其它地址</a>');
	}
	bindli($goalAddress);
}
/**
 * 复制所有
 */
function copyAllAdd(){
	var $addressAll = $('.hide_address').clone();
	var $goalAddress = $('#checkout_info').find('ul.radio:first');//目标object
	$goalAddress.empty();
	$goalAddress.append($addressAll.html());
	bindli($goalAddress);
}

/**
 * 展示添加地址视图
 * 
 * @param obj
 */
function showAddView(obj){
	$('#pageOverlay').toggle();
	$('.address-box:last').toggle();
	$('.tishi_error_line').hide();
	$('.tishi_ok_line').hide();
}

/**
 * clear data
 */
function clearData(obj){
	$(".adresswarn").hide();
    $("#adresswarn-box").hide();
	var $obj_div = $('.address-box:last');
	$obj_div.find($obj_div.find('input')[0]).attr('value',"");//distAddInfo.consignee
	$obj_div.find($obj_div.find('input')[1]).attr('value',"");//distAddInfo.consignee
	var $province_div = $obj_div.find($obj_div.find('select')[0]);//distAddInfo.province
	$province_div.val("");
	$obj_div.find($obj_div.find('input')[2]).val("");//distAddInfo.street
	$obj_div.find($obj_div.find('input')[3]).val("");//distAddInfo.mobile
	$obj_div.find($obj_div.find('input')[4]).val("");//distAddInfo.areaCode
	$obj_div.find($obj_div.find('input')[5]).val("");//distAddInfo.phone
	$obj_div.find($obj_div.find('input')[6]).val("");//distAddInfo.extension
	var $checkBox = $obj_div.find($obj_div.find('input')[7]);
	$checkBox.val('1');
	$checkBox.attr('checked',false);
	$checkBox.prop("disabled",false);
	showAddView();
}

function hasLogin(){
	//判断登录
	var flag = false;
	try{
		$.ajax({
	        type: "POST",
	        url: "/goodsinfoajax/hasLoginAjax.htm",
	        data: {},
	        async:false,
	        dataType: "json",
	        success: function(data){
			 flag = false;
	         if(data == false){
	        	$(".denglu").show();
	          	$(".login-box").show();
	          	showAddView(obj);//隐藏
	         }else{
			   	flag = true;
	         }
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	          // report error
			  flag = false;
		  }
	    });		   
		}catch(err){
			  flag = false;
	   }
//	if(!flag) return;
	return flag;
}

/**
 * add one address
 * @param obj
 */
function addOneAdd(obj,index){
	if(!hasLogin()) return;
	
	var update='';
	var datajson2 = $("#checkout_or").serializeObject();
	var url = "/cusercenter/distributionAddressInfo/saveDAddressInfoToJson.do";
	if(datajson2['distAddInfo.id'] != undefined && datajson2['distAddInfo.id'] != ""){
		url = "/cusercenter/distributionAddressInfo/updateDAddressInfoToJson.do";
	}
	var provice = datajson2['distAddInfo.province'];
	var city = datajson2['distAddInfo.city'];
	var county = datajson2['distAddInfo.county'];
	var street = datajson2['distAddInfo.street'];
	var consignee = datajson2['distAddInfo.consignee'];
	var mobile = datajson2['distAddInfo.mobile'];
	var areaCode = datajson2['distAddInfo.areaCode'];
	var phone = datajson2['distAddInfo.phone'];
	var extension = datajson2['distAddInfo.extension'];
	var $consignee = $("input[name='distAddInfo.consignee']");
	var $province = $("select[name='distAddInfo.province']");
	var $city = $("select[name='distAddInfo.city']");
	var $county = $("select[name='distAddInfo.county']");
	var $street = $("input[name='distAddInfo.street']");
	var $mobile = $("input[name='distAddInfo.mobile']");
	var $areaCode = $("input[name='distAddInfo.areaCode']");
	var $phone = $("input[name='distAddInfo.phone']");
	var $extension = $("input[name='distAddInfo.extension']");
	
	var nonePhoneMobile = "电话和手机至少填写一个！";
	var errorMobile = "手机格式不正确！";
	var errorPhone = "固定电话格式不正确！";
	var nomarlConsigne = "请输入收货人姓名/最少不能低于2个字";
	var nomarlAddress = "请选择省、市、县！";
	var nomarlStreet = "最少5个字，最多不能超过120个字！";
	var nomarlContant = "电话和手机至少填写一个！";
	/*$consignee.bind({
		change : function(){
			addOneAdd(obj,"1");
		}
	});
	$province.bind({
		change : function(){
			addOneAdd(obj,"2");
		}
	});
	$city.bind({
		change : function(){
			addOneAdd(obj,"2");
		}
	});
	$county.bind({
		change : function(){
			addOneAdd(obj,"2");
		}
	});
	$street.bind({
		change : function(){
			addOneAdd(obj,"3");
		}
	});
	$mobile.bind({
		change : function(){
			addOneAdd(obj,"4");
		}
	});
	$areaCode.bind({
		change : function(){
			addOneAdd(obj,"4");
		}
	});
	$phone.bind({
		change : function(){
			addOneAdd(obj,"4");
		}
	});
	$extension.bind({
		change : function(){
			addOneAdd(obj,"4");
		}
	});*/
	if(index=="1")return;
	if(consignee==undefined || consignee == ""){
		$consignee.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
		$consignee.parent().next().show();
		$consignee.parent().next().text(nomarlConsigne);
		return ;
	} else {
		var len = jmz.GetLength(consignee);
		if(len<2) {
			$consignee.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
			$consignee.parent().next().text(nomarlConsigne);
			$consignee.parent().next().show();
			return;
		}
		$consignee.parent().next().removeClass('tishi_error_line').addClass('tishi_ok_line');
		$consignee.parent().next().text("");
//		$consignee.parent().next().hide();
	}
	if(index=="2")return;
	if(provice==undefined || provice == "" || city == undefined || city == "" || county == undefined || county == ""){
		$county.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
		$county.parent().next().text(nomarlAddress);
		$county.parent().next().show();
		
		return ;
	} else {
		$county.parent().next().removeClass('tishi_error_line').addClass('tishi_ok_line');
		$county.parent().next().text("");
//		$county.parent().next().hide();
	}
	if(index=="3")return;
	if(street==undefined || street == ""){
		$street.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
		$street.parent().next().text(nomarlStreet);
		$street.parent().next().show();
		return ;
	} else {
		var len = jmz.GetLength(street);
		if(len<5 || len>120) {
			$street.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
			$street.parent().next().text(nomarlStreet);
			$street.parent().next().show();
			return;
		}
		$street.parent().next().removeClass('tishi_error_line').addClass('tishi_ok_line');
		$street.parent().next().text("");
//		$street.parent().next().hide();
	}
	
	if(index=="4")return;
	if((mobile==undefined || mobile == "") && (phone == undefined || phone == "")){
		$extension.parent().next().text(nonePhoneMobile);
		$extension.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
		$extension.parent().next().show();
		return ;
	} else {
		var len = jmz.GetLength(mobile);
		if(mobile != undefined && mobile!="" && len<11){
			$extension.parent().next().text(errorMobile);
			$extension.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
			$extension.parent().next().show();
			return;
		}
		var lenA = jmz.GetLength(areaCode);
		var lenP = jmz.GetLength(phone);
		var lenE = jmz.GetLength(extension);
		if((lenA != undefined && lenA !="" && lenA < 3) || (lenP != undefined && lenP !="" && lenP > 10) ){
			$extension.parent().next().text(errorPhone);
			$extension.parent().next().removeClass('tishi_ok_line').addClass('tishi_error_line');
			$extension.parent().next().show();
			return;
		}
		$extension.parent().next().removeClass('tishi_error_line').addClass('tishi_ok_line');
		$extension.parent().next().text("");
//		$extension.parent().next().hide();
	}
	if(datajson2["distAddInfo.areaCode"] == "")datajson2["distAddInfo.areaCode"] = "0";
	if(datajson2["distAddInfo.phone"] == "")datajson2["distAddInfo.phone"] = "0";
	if(datajson2["distAddInfo.extension"] == "")datajson2["distAddInfo.extension"] = "0";
	
	try{
		$.ajax({
			type : "post",
			url  : url,
			dataType : "json",
			async : false,
			data : datajson2,
			success: function(data){
				if(data == null || data == "null"){
					alert('添加失败');
				} else {
					var $hide_address = $('.hide_address');
					var $li;
					$hide_address.empty();
					$hide_address.append($('<li><input type="button" class="btn_xinzeng" id="" value="新增收货地址" onclick="clearData(this);"></li>'));
//					console.info(data)
					for(var index in data){
						var item = data[index];
						if(item.isDefault == "1"){
							//处理已经选择的地址
							$li = $('<li class="songzhi"><span class="jisong">寄送至</span><input class="niceRadio" type="radio" name="orderInfo.receiveAddress" value="'+item.id+'" checked="checked"/>'+item.provinceName+item.cityName+item.countyName+item.street+'('+item.consignee+' 收）'+item.mobile+'<span class="moren_gray">默认地址</span><span class="moren_lan"><a onclick="modifiedAdd(this)">修改本地址</a></span></li>');
							$hide_address.find('li:first').before($li);
						} else {
							//处理已经选择的地址
							$li = $('<li class="default"><span class="jisong">寄送至</span><input class="niceRadio" type="radio" name="orderInfo.receiveAddress" value="'+item.id+'"/>'+item.provinceName+item.cityName+item.countyName+item.street+'('+item.consignee+' 收）'+item.mobile+'</li>');
							$hide_address.find('input:last').parent().before($li);
						}
					}
//					console.info("已经改变后的$hide_address")
//					console.info($hide_address)
					showAddView();
					copyAllAdd();
				}
				
			},
			error : function(err){
				alert('添加失败');
			}
		});
	}
	catch(err){
		alert('添加失败');
	}
}
/**默认地址设置处理*/
function delDefault1(obj){
	var $obj = $(obj);
	$obj.find('li').each(function(index){
		$(this).find('span.moren_gray').remove();
	});
}
/**非默认地址设置处理*/
function delDefault(obj){
	var $obj = $(obj);
	$obj.find('li').each(function(index){
		if($(this).hasClass('songzhi')){
			$(this).removeClass('songzhi').addClass('default');
			$(this).find('input').attr('checked',false);
			$(this).find('span.moren_lan').remove();
		}
	});
}
var flags=0;
function couponsub(){
	$(".youhui").html("");
	var coupon=$("*[name='orderInfocoupontext']").val(); //获取value值 
	var allPrice=$("*[name='orderInfo.goodsMoney']").val();
	var specialPrice=$("*[name='specialPrice']").val();
	var postCost=$("*[name='orderInfo.postCost']").val();//运费
	var freeMoney=$("*[name='freeMoney']").val();//优惠策略的优惠金额
	if(freeMoney==null||freeMoney==""){
		freeMoney=0;
	}
	if(coupon!=""&&coupon!=null){
	 $.ajax({
	    type: "POST",
	    url: "/shopcarinfo/couponForAjax.do",
	    data: {couponNum:coupon,allPrice:allPrice},
	    dataType: "json",
	    success: function(data){
	    	if(data!=""&&data!=null){
	    		if(data.flag!=''){
	    			$(".youhui").html("<span style='color: red'>"+data.flag+"</span>。");
	    		}else{
	    			$("#couponNum").html("－¥ "+data.couponMoney+"<input type='hidden' name='orderInfo.coupon'  value='"+data.id+"'/>"+
	    					"<input type='hidden' name='coupon'  value='"+coupon+"'/>"
				    		+"<input type='hidden' name='orderInfo.couponMoney'  value='"+data.couponMoney+"'/>");
		    		$("#couponNum").css('display' ,'');
		    		
		    		var playPrice ;
		    		var buyMethod = $('input[name="orderInfo.pickUpMethod"]').filter(':checked').val();
		    		if(1 == buyMethod) {
		    			  playPrice=(parseFloat(allPrice)-parseFloat(data.couponMoney)-parseFloat(freeMoney)).toFixed(2);
		    		}else {
		    			  playPrice=(parseFloat(allPrice)-parseFloat(data.couponMoney)+parseFloat(postCost)-parseFloat(freeMoney)).toFixed(2);
		    		}
		    		
		    		/*var playPrice=(parseFloat(allPrice)-parseFloat(data.couponMoney)+parseFloat(postCost)-parseFloat(freeMoney)).toFixed(2);*/
		    		$("#palyprice").html("<input type='hidden' name='orderInfo.realPayMoney' value='"+playPrice+"'/>¥ "+playPrice+"");
//		    		$(".tishi").html("温馨提示：每个订单只能使用一张优惠券,使用优惠券后，如果您的商品总金额不满足全场满赠条件，则赠品将自动删除。");
		    		$(".tishi").html("温馨提示：每个订单只能使用一张优惠券，直接输入优惠券号后必须点击“使用”进行验证才有效！");
		    		$(".youhui").html("可优惠<span class='score_num'>"+data.couponMoney+"</span>元 ");
	    		}
    		}else{
    			$(".youhui").html("<span style='color: red'>优惠券卡号不正确，请重新输入</span>。");
    			$("#couponNum").html("－¥0.00 ");
    			var playPrice=(parseFloat(allPrice)+parseFloat(postCost)-parseFloat(freeMoney)).toFixed(2);
    			$("#palyprice").html("<input type='hidden' name='orderInfo.realPayMoney' value='"+playPrice+"'/>¥ "+playPrice+"");
	    	}
	    	
	    }
	   });
	}
}
var flag=0;
function sub(){
	var coupon=$("*[name='orderInfocoupon']").val(); //获取value值 
	var allPrice=$("*[name='orderInfo.goodsMoney']").val();
	var specialPrice=$("*[name='specialPrice']").val();
	var postCost=$("*[name='orderInfo.postCost']").val();//运费
	var freeMoney=$("*[name='freeMoney']").val();//优惠策略的优惠金额
	if(freeMoney==null||freeMoney==""){
		freeMoney=0;
	}
	if(coupon!=""&&coupon!=null){
	 $.ajax({
	    type: "POST",
	    url: "/shopcarinfo/couponAjax.htm",
	    data: {couponNum:coupon,allPrice:specialPrice},
	    dataType: "json",
	    success: function(data){
	    	if(data!=""&&data!=null){
    			$("#couponNum").html("－¥ "+data.couponMoney+"<input type='hidden' name='orderInfo.coupon'  value='"+data.id+"'/>"+
    					"<input type='hidden' name='coupon'  value='"+coupon+"'/>"
			    		+"<input type='hidden' name='orderInfo.couponMoney'  value='"+data.couponMoney+"'/>");
	    		$("#couponNum").css('display' ,'');
	    		var goodsMoney=$("*[name='orderInfo.goodsMoney']").val();
	    		
	    		var playPrice ;
	    		var buyMethod = $('input[name="orderInfo.pickUpMethod"]').filter(':checked').val();
	    		if(1 == buyMethod) {
	    			  playPrice=(parseFloat(allPrice)-parseFloat(data.couponMoney)-parseFloat(freeMoney)).toFixed(2);
	    		}else {
	    			  playPrice=(parseFloat(allPrice)-parseFloat(data.couponMoney)+parseFloat(postCost)-parseFloat(freeMoney)).toFixed(2);
	    		}
	    		
    			/* playPrice=(parseFloat(goodsMoney)-parseFloat(data.couponMoney)+parseFloat(postCost)-parseFloat(freeMoney)).toFixed(2);*/
	    		$("#palyprice").html("<input type='hidden' name='orderInfo.realPayMoney' value='"+playPrice+"'/>¥ "+playPrice+"");
    		}
	    }
	   });
	}else{
		$("#couponNum").html("－¥0.00 ");
		var playPrice=(parseFloat(allPrice)+parseFloat(postCost)-parseFloat(freeMoney)).toFixed(2);
		$("#palyprice").html("<input type='hidden' name='orderInfo.realPayMoney' value='"+playPrice+"'/>¥ "+playPrice+"");

	}
}

function modifiedAdd(obj){
	
	if(!hasLogin()) return;
	
	var $obj = $(obj);
	var $obj_div = $('.address-box:last');
	var id = $obj.parent().parent().find('input').val();
	$('#distAddInfo_id').val(id);
	try{
		$.ajax({
			type : "post",
			url  : "/cusercenter/distributionAddressInfo/getDAddressInfoToJson.do",
			dataType : "json",
			async : false,
			data :
			{
				"deleteId" : id
			},
			success: function(data){
				if(data == null || data == "null"){
					alert('查询失败');
				} else {
					$obj_div.find($obj_div.find('input')[1]).attr('value',data.consignee);//distAddInfo.consignee
					var $province_div = $obj_div.find($obj_div.find('select')[0]);//distAddInfo.province
					$province_div.val(data.province);
					getCity(data.province,data.city,data.county);
					$obj_div.find($obj_div.find('input')[2]).val(data.street);//distAddInfo.street
					$obj_div.find($obj_div.find('input')[3]).val(data.mobile);//distAddInfo.mobile
					$obj_div.find($obj_div.find('input')[4]).val(data.areaCode=="0"?"":"0"+data.areaCode);//distAddInfo.areaCode
					$obj_div.find($obj_div.find('input')[5]).val(data.phone=="0"?"":data.phone);//distAddInfo.phone
					$obj_div.find($obj_div.find('input')[6]).val(data.extension=="0"?"":data.extension);//distAddInfo.extension
					var $checkBox = $obj_div.find($obj_div.find('input')[7]);
					if(data.isDefault == "1"){
						$checkBox.attr('checked',true);
						$checkBox.parent().hide();
					}else{
						$checkBox.attr('checked',false);
						$checkBox.parent().show();
					}
					
				}
				
			},
			error : function(err){
				alert('查询失败');
			}
		});
	}
	catch(err){
//		console.info(err);
	}
	
	showAddView(obj);
	
}

/**
 * bind click,mouseover,mouseout
 */
function bindli(obj){
	var $hide_address = obj;
	var $lis = $hide_address.find('li');
	$lis.each(function(index){
		if(index==$lis.size()-1 && ($(this).attr('class')==undefined))return false;
		$(this).bind({
			mouseenter:function(){
				if(!$(this).hasClass('songzhi'))				$(this).addClass('hover');
				if($(this).find('span.moren_gray').length>0)return;
				if($(this).hasClass('songzhi')){
					var $isDefalt = $('<span class="moren_hui"><a onclick="setDefault(this,'+$(this).find('input.niceRadio').val()+')">设为默认收货地址</a></span>');
				} else {
					var $isDefalt = $('<span class="moren_blue"><a onclick="setDefault(this,'+$(this).find('input.niceRadio').val()+')">设为默认收货地址</a></span>');
				}
				if($(this).find('span.moren_lan').length>0){
					$(this).find('span.moren_lan').before($isDefalt);
				} else {
					$(this).append($isDefalt);
				}
			},
			mouseleave:function(){
				$(this).removeClass('hover');
				$(this).find('span.moren_blue').remove();
				$(this).find('span.moren_hui').remove();
			}
		});
		
		$(this).find('input.niceRadio').bind({
			click:function(){
				var isChecked = $(this).attr('checked');
				delDefault(obj);
				if(isChecked=="checked") $(this).attr('checked',true);
				var moa = $('<span class="moren_lan"><a onclick="modifiedAdd(this)">修改本地址</a></span>');
				if($(this).parent().find('span.moren_lan').length==0)$(this).parent().append(moa);
				$(this).parent().find('span.moren_blue').remove();
				$(this).parent().removeClass('default').removeClass('hover').addClass('songzhi');
			}
		});
	});
}

function setDefault(obj,id){
	var $obj = $(obj).parent().parent();
	var url = "/cusercenter/distributionAddressInfo/updateDefaultToJson.do";
	try{
		$.ajax({
			type : "post",
			url  : url,
			dataType : "json",
			async : false,
			data :
			{
				newDistAddId : id
			},
			success: function(data){
				if(data == null || data == "null"){
					setDefaultError($obj);
				} else {
					delDefault1($obj.parent());
					$(obj).remove();
					$obj.append($('<span class="moren_gray">默认地址</span>'));
					$obj.append($('#success_div').html());
					if($obj.find('span.tishi_ok').length>0){
						setTimeout(function(){
							$obj.find('span.tishi_ok').remove();
						},2000);
					}
				}
				
			},
			error : function(err){
				setDefaultError($obj);
			}
		});
	}
	catch(err){
		setDefaultError($obj);
	}
}
/**set default address failed*/
function setDefaultError(obj){
	obj.append($('#error_div').html());
	if(obj.find('span.tishi_ok').length>0){
		setTimeout(function(){
			obj.find('span.tishi_ok').remove();
		},2000);
	}
}

var jmz = {};
jmz.GetLength = function(str) {
    ///<summary>获得字符串实际长度，中文2，英文1</summary>
    ///<param name="str">要获得长度的字符串</param>
    var realLength = 0, len = str.length, charCode = -1;
    for (var i = 0; i < len; i++) {
        charCode = str.charCodeAt(i);
        if (charCode >= 0 && charCode <= 128) realLength += 1;
        else realLength += 2;
    }
    return realLength;
};
 