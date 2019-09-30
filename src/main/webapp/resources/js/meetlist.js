/**
 * 
 */
var meetListService = (function(){
	function getList(groupid,memberid,callback,error){
		$.getJSON("/meet/getList/"+groupid+"/"+memberid+".json",
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
	
	function meetRead(meetid,groupid,memberid,callback,error){
		$.get("/meet/detailedmeet/"+meetid+"/"+groupid+"/"+memberid+".json",
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
		getList : getList,
		parseDate : parseDate,
		meetRead : meetRead
	};
})();

