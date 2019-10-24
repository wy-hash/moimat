/**
 * 
 */
var teamMember = (function(){
	function getList(param,callback,error){
		var groupId = param.groupId;
		var status = param.status;
		var page = param.pageNum || 1;
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
	
	function joinbutton(buttonId,teamId,memId){
		$.get("/isAttendTeam/"+teamId+"/"+memId+".json",function(data){
			var groupMemberVO = {"teamId" : teamId, "memberId" : memId}
			if(data){
				buttonId.text("탈퇴하기");
				buttonId.on("click",function(){
				bootbox.confirm("모임에서 탈퇴하시겠습니까",function(result){
					if(result){
							$.ajax({
			            		type : 'delete',
			            		url : '/withdraw',
			            		datatype : "json",
			            		data : JSON.stringify(groupMemberVO),
			            		contentType : "application/json; charset=utf-8",
			            		success : function(result){
			            			location.reload(); //성공하면 새로고침
			            		}
			            	});
						
					}else{
						
					}
				})
				
				});
				
			}else{
				buttonId.text("가입하기");
				buttonId.on("click",function(){
				bootbox.confirm("모임에 가입하시겠습니까",function(result){
					if(result){
						$.ajax({
		            		type : 'post',
		            		url : '/attend',
		            		datatype : "json",
		            		data : JSON.stringify(groupMemberVO),
		            		contentType : "application/json; charset=utf-8",
		            		success : function(result){
		            			location.reload(); //성공하면 새로고침
		            		}
		            	});
					}
				});
				});
			}
		});
	}
	
	return {
		getList : getList,
		parseDate : parseDate,
		getMember : getMember,
		isMaster : isMaster,
		isAdmin : isAdmin,
		joinbutton : joinbutton
	}
})();