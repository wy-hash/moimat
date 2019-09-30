/**
 * 
 */
$(document).ready(function() {


	// Calendar
	// =================================================================
	// Require Full Calendar
	// -----------------------------------------------------------------
	// http://fullcalendar.io/
	// =================================================================


	// initialize the external events
	/*// -----------------------------------------------------------------
	$('#demo-external-events .fc-event').each(function() {
		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			title: $.trim($(this).text()), // use the element's text as the event title
			stick: true, // maintain when user navigates (see docs on the renderEvent method)
			className : $(this).data('class')
		});
	});*/


	// Initialize the calendar
	// -----------------------------------------------------------------
	$('#demo-calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: false,
		droppable: false, // this allows things to be dropped onto the calendar
		defaultDate: new Date(),
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: 'Happy Hour',
				start: '2019-09-24',
				className: 'purple'
			},
			{
				title: 'Birthday Party',
				start: '2019-09-26',
				className: 'mint'
			}
		]
	});

});

//=========================
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

