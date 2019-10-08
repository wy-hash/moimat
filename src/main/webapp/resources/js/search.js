	 	$(document).ready(function() {
	 		 $("input[name=category]").on("click", function(){
	 			 $("#interest").load("/resources/btn.html", function(){
	 				$("input[name=btn]").each(function() {
	 					var btnValue = $(this).val();
	 				});
	 				 $("input[name=btn]").on("click", function(){
	 					 var btnSubmit = $(this).val();
	 					$("#searchKeyword").attr("value", btnSubmit);
	 					$("#searchForm").submit();
	 				 });
	 			 });
	 		    return false;
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
	 		 			url:		"/home/searchautocomplete",
	 	 				type:		"POST",
	 	 				dataType:	"json",
	 		 			data:		request,
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
	 			open: function () {
	 	            $(this).data("autocomplete").flexdatalist;
	 	        }
	 		});
	 	});
	 	
	 	$("#selectType").change(function(){
	 		var text = $("#selectType option:selected").text();
	 		$('#searchKeyword').autocomplete({
	 			source:	function(request, response) {
	 				$.ajax({
	 		 			url:		"/home/search",
	 	 				type:		"POST",
	 	 				dataType:	"json",
	 		 			data:		request,
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
	 			open: function () {
	 	            $(this).data("autocomplete").flexdatalist;
	 	        }
	 		});
	 	});