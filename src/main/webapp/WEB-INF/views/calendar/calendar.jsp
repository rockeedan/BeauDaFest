<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/css/calendar/packages/core/main.css' rel='stylesheet' />
<link href='resources/css/calendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='resources/css/calendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='resources/css/calendar/packages/list/main.css' rel='stylesheet' />
<script src='resources/css/calendar/packages/core/main.js'></script>
<script src='resources/css/calendar/packages/interaction/main.js'></script>
<script src='resources/css/calendar/packages/daygrid/main.js'></script>
<script src='resources/css/calendar/packages/timegrid/main.js'></script>
<script src='resources/css/calendar/packages/list/main.js'></script>
<script src='resources/js/jquery-3.js'></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var date = new Date();
    var d = date.getDate();
    var m = (date.getMonth()+1>9)?(date.getMonth()+1):'0'+(date.getMonth()+1);
    var y = date.getFullYear();
 	

  
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      defaultDate: y+'-'+m+'-'+d,
      navLinks: true, // can click day/week names to navigate views

      weekNumbers: true,
      weekNumbersWithinDays: true,
      weekNumberCalculation: 'ISO',

      editable: true,
      eventLimit: true, // allow "more" link when too many events
      
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
<script type="text/javascript">

$(function(){
	$.ajax({
		url : '/beaudafest/calcal',
		data: {
			greeting : 'hi'
		},
		success : function (data){
			console.log(data)
			$('.fc-day').html(data)
		}
		
		
		
	})
})

</script>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>
