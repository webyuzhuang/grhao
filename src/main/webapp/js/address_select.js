 $(function() {
	 
    	sheng();
    	$("#sheng").change(function() {
    		alert("z这是省");
    		shi();

    	});
    	$("#shi").change(function() {
    		qu();

    	});
    	reveal();
    
    	
    });
    function sheng() {
    	$.ajax({
    		url : '../orderadd.do',
    		type : 'get',
    		cache : 'false',
    		data : {
    			flag : "sheng"
    		},
    		dataType : 'json',
    		success : function(d) {
    			var sh = $('#sheng');
    			sh.find('option').not(':first').remove();
    			$('#shi').find('option').not(':first').remove();
    			for ( var i in d) {
    				var a = d[i];
    				var she = "<option value='" + a.region_id + "'>"
    						+ a.region_name + "</option>";
    				sh.append(she);
    			}
    		}

    	});
    }
    function shi() {
    	$.ajax({
    		url : '../orderadd.do',
    		type : 'get',
    		data : {
    			region_id : $('#sheng').val(),
    			flag : "shi"
    		},
    		cache : 'false',
    		dataType : 'json',
    		success : function(d) {
    			var sh = $('#shi');
    			sh.find('option').not(':first').remove();
    			$('#qu').find('option').not(':first').remove();
    			for ( var i in d) {
    				var a = d[i];
    				var e = "<option value='" + a.region_id + "'>" + a.region_name
    						+ "</option>";
    				sh.append(e);
    			}
    		}

    	});
    }
    function qu() {
    	$.ajax({
    		url : '../orderadd.do',
    		type : 'get',
    		data : {
    			region_id : $('#shi').val(),
    			flag : 'qu'
    		},
    		cache : 'false',
    		dataType : 'json',
    		success : function(d) {
    			var sh = $('#qu');
    			sh.find('option').not(':first').remove();
    			for ( var i in d) {
    				var a = d[i];
    				var she = "<option value='" + a.region_id + "'>"
    						+ a.region_name + "</option>";
    				sh.append(she);
    			}
    		}

    	});

    }

    function add() {
    	$.ajax({
    		url : '../orderadd.do',
    		type : 'post',
    		data : {
    			order_name : $('#name').val(),
    			order_tel : $('#tel').val(),
    			province : $('#sheng').val(),
    			city : $('#shi').val(),
    			region_county : $('#qu').val(),
    			street : $('#str').val(),
    			address_eml : $('#eml').val(),
    			"i" : 1
    		},
    		cache : 'false',
    		dataType : 'text',
    		success : function(d) {
    			alert(d);
    			$('#insert').hide();
    			window.location.reload();
    		}

    	});
    }

    function reveal() {
    	$.ajax({
    		url : '../orderadd.do',
    		type : "POST",
    		data : {
    			"i" : 2
    		},
    		cache : 'false',
    		dataType : 'json',
    		success : function(d) {
    			var ta=$('#xian');
    			for(var i in d){
    				var e=d[i];
    				var t="<tr>"
    					+"<td>"+e.id+"</td>"
    					+"<td>"+e.order_name+"</td>"
    					+"<td>"+e.order_tel+"</td>"
    					+"<td>"+e.province+"</td>"
    					+"<td>"+e.city+"</td>"
    					+"<td>"+e.region_county+"</td>"
    					+"<td>"+e.street+"</td>"
    					+"<td>"+e.address_eml+"</td>"
    					+"<td>" 
    				    +"<a href='javaScript:void(0)' nature='"+e.id+"' id='shans1' title='删除' onclick=(shan(this)) ><img src='../img/icon_drop.gif'/></a>&nbsp;"
    					+"<a href='javaScript:void(0)' natures='"+e.id+"' id='bians1' title='编辑 ' ><img src='../img/icon_edit.gif' /></a>"
    					+"</td>"
    					+"</tr>";
    				    ta.append(t);
    			          }
    					
    		}
    	});
    }
  function shan(t){
	  var aff=confirm("你确定要删除吗？");
	  if(aff==true){
	  $.ajax({
	    		url : '../orderadd.do',
	    		type : "POST",
	    		data : {
	    			"i" : 3,
	    			id:$(t).attr('nature')
	    		},
	    		cache : 'false',
	    		dataType : 'text',
	    		success:function(d){
	    			window.location.reload();
	    		}
              	  
	  });
	  }
  } 
    
    