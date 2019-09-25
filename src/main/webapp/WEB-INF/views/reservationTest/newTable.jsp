<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='/beaudafest/resources/css/calendar/packages/core/main.css' rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/list/main.css' rel='stylesheet' />
<script src='/beaudafest/resources/css/calendar/packages/core/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/interaction/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/daygrid/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/timegrid/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/list/main.js'></script>
<script src='/beaudafest/resources/js/jquery-3.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
	var event=[
  	  {
          title: 'Meeting',
          url:'/beaudafest/reservation/test',
          start: '2019-09-25 12:30:00',
          end: '2019-09-25T13:00:00'
        },
        {
            title: 'Conference',
            start: '2019-09-25T15:30:00',
            end: '2019-09-25T16:00:00'
          },
  ];
	$.ajax({
		url:"/beaudafest/reservation/eventTest",
		success:function(data){
			event=data;
		}
	})
	  
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      
      validRange: function() {
    	  var nowDate = new Date();  
    	    return {
    	        start: nowDate,
    	        end: new Date().setMonth(nowDate.getMonth()+2)
    	      }
      },

      weekNumbers: true,
      weekNumbersWithinDays: true,
      weekNumberCalculation: 'ISO',

      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events:event
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>
</body>
</html>