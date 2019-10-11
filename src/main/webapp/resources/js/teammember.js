/**
 * 
 */
var teamMember = (function(){
	function getList(param,callback,error){
		var groupId = param.groupId;
		var status = param.status;
		var page = param.page || 1;
		var criteria = {pageNum: page, type : param.type||'' , keyword : param.keyword||''};
		$.getJSON("/getMemberList/"+groupId+"/"+status+".json",criteria, function(data){
				if(callback){
					callback(data);
				}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function getMember(memberid,callback,error){
		$.get("/getMember/"+memberid+".json",function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function isMaster(groupid,memberid,callback){
		$.get("/isMaster/"+groupid+"/"+memberid+".json",function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	function isAdmin(groupid,memberid,callback){
		$.get("/isAdmin/"+groupid+"/"+memberid+".json",function(data){
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
		
		return [yy,'/',(mm > 9 ? '' : '0')+mm,'/',(dd > 9 ? '' : '0')+dd].join('');
	}
	
	return {
		getList : getList,
		parseDate : parseDate,
		getMember : getMember,
		isMaster : isMaster,
		isAdmin : isAdmin
	}
})();