/*��ҳ������ʾ*/
$(document).ready(function(){
	var topMain=$(".grid_2").height();//��ͷ���ĸ߶ȼ�ͷ����nav����֮��ľ���
	var nav=$("#nav_bg");
	$(window).scroll(function(){
		if ($(window).scrollTop()>topMain){//��������������ľ������topMain���nav�����������.nav_scroll��������Ƴ�
			nav.addClass("topdh_scroll");
		}else{
			nav.removeClass("topdh_scroll");
		}
	});
});