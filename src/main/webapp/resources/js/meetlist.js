/**
 * 
 */
var meetListService = (function(){
	function getList(groupid,memberid,callback,error){
		$.getJSON("/cal/ca/"+groupid+"/"+memberid+".json",
				function(data){
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
		getList : getList
	};
})();



