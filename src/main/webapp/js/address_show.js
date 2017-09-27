$(function(){
	show();
});
function show() {
    	$.ajax({
    		url : '../orderadd.do',
    		type : "POST",
    		data : {
    			"i" : 2
    		},
    		cache : 'false',
    		dataType : 'json',
    		success : function(d) {
    			var ta=$('#cha');
    			for(var i in d){
    				var e=d[i];
    				var m=e.defa=='y'?'checked':'';
    				var t="<p id='mo'>"+
    				"<input type='radio' name='n'"+m+" ii='"+e.id+"'  onclick='mo(this)'/>"+
    					e.province+e.city+e.region_county+e.street+"<span>("+e.order_name+"&nbsp;收)</span>"+e.order_tel
    					+"</p>";
    				    ta.append(t);
    			}   					
    		}
    	});
    }

function mo(t){
	$.ajax({
		url : '../orderadd.do',
		type : "POST",
		data : {
			"i" : 4,
			id:$(t).attr('ii')
		},
		cache : 'false',
		dataType : 'text',
		success : function(d) {
		    alert(d);	
		
			}   					
		
	});
	
	
	
	
}