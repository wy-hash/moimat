	 		$(document).ready(function(){
	 			$.ajax({
	 				url:		"/home/search",
	 				type:		"post",
	 				dataType:	"json",
	 				success:	function(data) {
	 					var result = data;
	 					console.log(result);
	 					for(i in result) {
	 						if( result[i].intKey.match('00') ){
	 							var upperIntKey = result[i].intKey;
	 							var upperIntName = result[i].intName;
	 							var upperinput = $('<input type="button" class="btn btn-default btn-rounded" id='+upperIntKey+' name="upperInte"/>');
	 							upperinput.appendTo($("#upperInner")); 
	 						
	 								$("#"+upperIntKey+"").attr("value", upperIntName);
	 						}
	 						
	 						if(result[i].intKey.match('00')){
	 							var aa = result[i].intKey.substr(1,1);
	 						}
	 						if(!result[i].intKey.match('00')){
	 							var bb = result[i].intKey.substr(1,1); 
	 						}
	 						
	 						if(aa == bb) {
	 							let lowerIntKey = result[i].intKey;
	 							let lowerIntName = result[i].intName;
	 							  
	 							$("#"+upperIntKey+"").one("click",function(){
	 							var lowerInput = $('<input type="button" class="btn btn-default btn-rounded" id='+lowerIntKey+' name="lowerInte"/>');
	 							lowerInput.appendTo($("#lowerInner")); 
		 						
		 						$("#"+lowerIntKey+"").attr("value", lowerIntName);
		 						$("#"+lowerIntKey+"").on("click", function(){
		 							var check = $(this).val();
		 							console.log(check);
		 							$("#searchKeyword").attr("value", check);
		 		 					$("#searchForm").submit();
		 						});
	 							});
	 						}
	 						$("#"+upperIntKey+"").on("click", function(){
	 							
	 				 		});
	 					} 
	 				},
	 				error: function(request, status, error) {
 		 				var msg = "ERROR : " + request.status + "<br>"
 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
 		 			      console.log(msg);
 		 			}
	 			});
	 		});
	 		
	 		$("#searchForm").submit(function(){
	 			var search = $('#searchKeyword').val();
	 			if($.trim(search).length < 1) {
	 				$("#searchKeyword").focus();
	 				alert("검색어를 입력해주세요.")
	 				return false;
	 			}
 			});
	 		
	 		$('#searchKeyword').autocomplete({
	 			source:	function(request, response) {
	 				$.ajax({
	 		 			url:		"/home/searchinterest",
	 	 				type:		"POST",
	 	 				dataType:	"json",
	 		 			data:		{ term: request.term },
	 		 			success:	function(data) {
	 		 				var result = data;
	 		 				response(result);
	 		 			},
	 		 			error: function(request, status, error) {
	 		 				var msg = "ERROR : " + request.status + "<br>"
	 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	 		 			      console.log(msg);
	 		 			}
	 		 		})
	 			},
	 		});
	 	
	 	$("#selectType").change(function(){
	 		var text = $("#selectType option:selected").text();
	 		console.log(text);
	 		$('#searchKeyword').autocomplete({
	 			source:	function(request, response) {
	 				$.ajax({
	 		 			url:		"/home/searcharea",
	 	 				type:		"POST",
	 	 				dataType:	"json",
	 		 			data:		{ term: request.term },
	 		 			success:	function(data) {
	 		 				var result = data;
	 		 				response(result);
	 		 			},
	 		 			error: function(request, status, error) {
	 		 				var msg = "ERROR : " + request.status + "<br>"
	 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	 		 			      console.log(msg);
	 		 			}
	 		 		})
	 			},
	 		});
	 	});
