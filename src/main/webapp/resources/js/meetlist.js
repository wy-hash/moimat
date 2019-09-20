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
	
	function parseDate(meetDate){
		var dateObj = new Date(meetDate);
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth()+1;
		var dd = dateObj.getDate();
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		
		return [yy,'/',(mm > 9 ? '' : '0')+mm,'/',(dd > 9 ? '' : '0')+dd,' ',
			(hh > 9 ? '' : '0')+hh,':',(mi > 9 ? '' : '0')+mi].join('');
	}
	return {
		getList : getList,
		parseDate : parseDate
	};
})();

