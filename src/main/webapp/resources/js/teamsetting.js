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
	return {
		getPage : getPage
	}
})();
