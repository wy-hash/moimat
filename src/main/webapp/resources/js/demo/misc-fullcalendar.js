
// Misc-FullCalendar.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -



$(document).ready(function() {


	// Calendar
	// =================================================================
	// Require Full Calendar
	// -----------------------------------------------------------------
	// http://fullcalendar.io/
	// =================================================================


	// initialize the external events
	// -----------------------------------------------------------------
	$('#demo-external-events .fc-event').each(function() {
		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			title: $.trim($(this).text()), // use the element's text as the event title
			stick: true, // maintain when user navigates (see docs on the renderEvent method)
			className : $(this).data('class')
		});


		// make the event draggable using jQuery UI
		/*$(this).draggable({
			zIndex: 99999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});*/
	});


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
		drop: function() {
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
		},
		defaultDate: new Date(),
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: 'Happy Hour',
				start: '2019-09-24',
				end: '2019-09-28',
				className: 'purple'
			},
			{
				title: 'Birthday Party',
				start: '2019-09-26',
				end: '2019-09-28',
				className: 'mint'
			}
		]
	});

});
