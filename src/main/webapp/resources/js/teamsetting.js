/**
 * 
 */
var teamsetting = (function(){
	function getPage(groupId,callback,error){
		$.get("/getSettingPage/"+groupId+".json",function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	function getSubInt(intkey,error){
		var subIntOption = '';
		$.get("/getSubInt/"+intkey+".json",function(data){
			for(var i = 0, len = data.length||0; i<len; i++){
				subIntOption += '<option data-intid='+data[i].intid+'>'
							 + 		data[i].intName
							 +  '</option>'
			}
			$("#subInt").html(subIntOption);
			$('#subInt').trigger("chosen:updated");
		});
	}
	
	function getRegion(areakey,error){
		var subAreaOption = '';
		$.get("/getRegion/"+areakey+".json",function(data){
			for(var i = 0, len = data.length||0; i<len; i++){
				subAreaOption += '<option data-areaid='+data[i].areaId+'>'
				  			  +   	data[i].areaRegionName
				  			  +  '</option>'
			}
			$("#subArea").html(subAreaOption);
			$("#subArea").trigger("chosen:updated");
			
		});
	}
	
	return {
		getPage : getPage,
		getSubInt : getSubInt,
		getRegion : getRegion
	}
})();
