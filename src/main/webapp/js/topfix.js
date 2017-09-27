/*首页浮动显示*/
$(document).ready(function(){
	var topMain=$(".grid_2").height();//是头部的高度加头部与nav导航之间的距离
	var nav=$("#nav_bg");
	$(window).scroll(function(){
		if ($(window).scrollTop()>topMain){//如果滚动条顶部的距离大于topMain则就nav导航就添加类.nav_scroll，否则就移除
			nav.addClass("topdh_scroll");
		}else{
			nav.removeClass("topdh_scroll");
		}
	});
});