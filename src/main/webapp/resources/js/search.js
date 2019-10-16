	 		$(document).ready(function(){
	 			$.ajax({
	 				url:		"/home/search",
	 				type:		"post",
	 				dataType:	"json",
	 				success:	function(data) {
	 					var result = data;
//	 					console.log(result);
	 					for(i in result) {
	 						
	 						if( result[i].intKey.match('00') )
	 						{
	 							var upperIntKey = result[i].intKey;
	 							var upperIntName = result[i].intName;
	 							var upperInput = $('<input type="button" class="btn btn-default btn-rounded" id='+upperIntKey+' name="upperInte"/>');
	 							upperInput.appendTo($("#upperInner")); 
	 						
	 								$("#"+upperIntKey+"").attr("value", upperIntName);
	 						}
	 						
	 						if(!(result[i].intKey.match('00')))
	 						{
								var lowerIntKey = result[i].intKey
								var lowerIntName = result[i].intName;
								var lowerInput = $('<input type="button" class="btn btn-default btn-rounded" id='+lowerIntKey+' name="lowerInte"/>');
								lowerInput.appendTo($("#lowerInner"));
								$("#"+lowerIntKey+"").attr("value", lowerIntName);
								$("#"+lowerIntKey+"").hide();
								
		 						$("#"+lowerIntKey+"").on("click", function(){
		 							var lowerIntVal = $(this).val();
		 							$("#searchKeyword").attr("value", lowerIntVal);
		 		 					$("#searchForm").submit();
		 						});
	 						}
	 					}
	 					
		 					var count = 0 ;
		 					$("input[name=upperInte]").on("click", function(){
		 						count++;
		 						console.log(count);
		 						
		 						if(count == 1){
		 							$("#lowerInner").children().hide();
		 						}
		 						
								var id = $(this).attr("id");
								var upperStrId = id.substr(1,1);
								var size = $("input[name=lowerInte]").length;
								count--;
								
									for(var i=0; i<size; i++) {
										var lowerId = $("input[name=lowerInte]").eq(i).attr("id");
										var lowerStrId = lowerId.substr(1,1);
										if(upperStrId == lowerStrId && count == 0){
											$("#"+lowerId+"").show();
										} 
									}
		 					});
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
	 	 				data:		{ keyword : request.term },
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
	 			$("#selectType option:selected").each(function(){
	 			if($("#selectType option:selected").text() == "관심사") {
	 				$('#searchKeyword').autocomplete({
	 					source:	function(request, response) {
	 						$.ajax({
		 		 			url:		"/home/searchinterest",
		 	 				type:		"POST",
		 	 				dataType:	"json",
		 	 				data:		{ keyword : request.term },
		 		 			success:	function(data) {
		 		 				var result = data;
		 		 				response(result);
		 		 			},
		 		 			error: function(request, status, error) {
		 		 				var msg = "ERROR : " + request.status + "<br>"
		 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
		 		 			      console.log(msg);
		 		 			}
	 						});
	 					},
	 				});
	 			}
	 			
	 			if($("#selectType option:selected").text() == "지역") {
	 				$('#searchKeyword').autocomplete({
	 		 			source:	function(request, response) {
	 		 				$.ajax({
	 		 		 			url:		"/home/searcharea",
	 		 	 				type:		"POST",
	 		 	 				dataType:	"json",
	 		 	 				data:		{ keyword : request.term },
	 		 		 			success:	function(data) {
	 		 		 				var result = data;
	 		 		 				response(result);
	 		 		 			},
	 		 		 			error: function(request, status, error) {
	 		 		 				var msg = "ERROR : " + request.status + "<br>"
	 		 		 			      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	 		 		 			      console.log(msg);
	 		 		 			}
	 		 		 		});
	 		 			},
	 		 		});
	 			}
 			});
 		});
