	$(document).ready(function(){
		$.ajax({
			url:	"/search",
		type:		"post",
		dataType:	"json",
		success:	function(data) {
			var result = data;
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
						$("#selectType").val("R");
						$("#searchKeyword").attr("value", lowerIntVal);
	 					$("#searchForm").submit();
					});
				}
			}
			
				var count = 0 ;
				$("input[name=upperInte]").on("click", function(){
					count++;
					console.log(count);
					if ($('#lowerInner').attr('data-upper') == $(this).attr('id')){
						if($("#lowerInner").css("display") =="block"){
							$("#lowerInner").hide();
						}else{
							$("#lowerInner").show();
						}
						
					}else{
						$('#lowerInner').attr('data-upper',$(this).attr('id'));
						$('#lowerInner').attr('data-upper');
						$("#lowerInner").show();
					}
					
					
					if(count == 1)
					{
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
		
		
		$.ajax({
			url:		"/search/area/list",
			type:		"post",
			dataType:	"json",
			success:	function(data) {
				var result = data;
				for(i in result) {

					if( result[i].areaKey.match('000') && result[i].areaRegionKey.match('010') )
					{
						var upperAreaKey = result[i].areaKey;
						var upperAreaName = result[i].areaName;
						var upperInput = $('<input type="button" class="btn btn-default btn-rounded" id='+upperAreaKey+' name="upperArea"/>');
						upperInput.appendTo($("#upperInner2")); 
					
							$("#"+upperAreaKey+"").attr("value", upperAreaName);
					}
					
//					if(!(result[i].areaKey.match('000')))
					if(true)
					{
						var lowerAreaRegionKey = result[i].areaRegionKey;
						var lowerAreaRegionName= result[i].areaRegionName;
						var lowerInput = $('<input type="button" class="btn btn-default btn-rounded" id='+lowerAreaRegionKey+' name="lowerArea"/>');
						lowerInput.appendTo($("#lowerInner2"));
						$("#"+lowerAreaRegionKey+"").attr("value", lowerAreaRegionName);
						$("#"+lowerAreaRegionKey+"").hide();
						
						$("#"+lowerAreaRegionKey+"").on("click", function(){
							var lowerAreaVal = $(this).val();
							$("#selectType").val("A");
							$("#searchKeyword").attr("value", lowerAreaVal);
		 					$("#searchForm").submit();
						});
					}
				}

				var count = 0 ;
				$("input[name=upperArea]").on("click", function(){
					count++;
					if ($('#lowerInner2').attr('data-upper') == $(this).attr('id')){
						if($("#lowerInner2").css("display") =="block"){
							$("#lowerInner2").hide();
						}else{
							$("#lowerInner2").show();
						}
					}else{
						$('#lowerInner2').attr('data-upper',$(this).attr('id'));
						$('#lowerInner2').attr('data-upper');
						$("#lowerInner2").show();
					}
					
					
					if(count == 1)
					{
						$("#lowerInner2").children().hide();
					}
					
					var id = $(this).attr("id");
					var upperStrId = id.substr(0,1);
					var size = $("input[name=lowerArea]").length;
					count--;
					
					for(var i=0; i<size; i++) {
						var lowerId = $("input[name=lowerArea]").eq(i).attr("id");
						var lowerStrId = lowerId.substr(0,1);
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
		
		
		
		
//		areaList();
		autoComple();
	});
	 							
	$("#searchForm").submit(function(){
		var search = $('#searchKeyword').val();
		let searchHint = $('#searchHint');
		if($.trim(search).length < 1) {
			$("#searchKeyword").focus();
			searchHint.css('color', 'red');
			searchHint.html('검색어를 입력해 주세요.');
			return false;
		}
	});
	
	$("#selectType").change(function(){
//		R : 관심사, M : 모임, A : 지역
		autoComple();
	});
	
	
function autoComple(){
	
	if($("#selectType").val() == "R") {
		$('#searchKeyword').autocomplete({
			source:	function(request, response) {
				$.ajax({
		 			url:		"/search/interest",
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
	} else if($("#selectType").val() == "A") {
		$('#searchKeyword').autocomplete({
 			source:	function(request, response) {
 				$.ajax({
 		 			url:		"/search/area",
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
	} else{
		$('#searchKeyword').attr('autocomplete','off');
	}
	
	if ($('.ui-helper-hidden-accessible') != null){
		$('.ui-helper-hidden-accessible').hide();
	}
}


function areaList(){
	
	
}
