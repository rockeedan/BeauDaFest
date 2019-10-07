<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href='/beaudafest/resources/css/calendar/packages/core/main.css' rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/list/main.css' rel='stylesheet' />
<script src='/beaudafest/resources/js/jquery-3.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='/beaudafest/resources/css/calendar/packages/core/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/interaction/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/daygrid/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/timegrid/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/list/main.js'></script>
<script>
	var reservationDate;
	var event;
	$.ajax({
		url:"/beaudafest/reservation/eventTest",
		dataType:'json',
		success:function(data){
			event=data;
			console.log(event[0])
		}
	})
  document.addEventListener('DOMContentLoaded', function() {
	/* var event=[
  	  {
          title: 'Meeting',
          url:'/beaudafest/reservation/test',
          start: '2019-09-26 12:30:00',
          end: '2019-09-26T13:00:00'
        },
        {
            title: "Conference",
            start: '2019-09-26T15:30:00',
            end: '2019-09-26T16:00:00'
          },
  ]; */
	  
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
      
      dateClick: function(info) {
  	    //alert('Clicked on: ' + info.dateStr);//2019-10-30
  	    reservationDate = info.dateStr
  	    $('.modal-body').html("");
  	    $.ajax({
  	    	url:"/beaudafest/reservation/reservationTable",
  	    	data:{addDate:reservationDate},
  	    	success:function(result){
		  	    $('.modal-body').html(result);
  	    	}
  	    })
  	    $('#myModal').modal();
  	  },

      editable: false,
      eventLimit: true, // allow "more" link when too many events
      //eventSources:[{events:event}]
      /* eventSources:{url:"/beaudafest/reservation/eventTest",
    	  color:'yellow',
    	  textColor:'black'} */
      eventSources:[{events:function(info, successCallback, failureCallback){
    	  $.ajax({
    			url:"/beaudafest/reservation/eventTest",
    			dataType:'json',
    			success:function(data){
    				successCallback(data);
    			}
    		})
      },color:"#FFC0CB"}]
    });

    calendar.render();
  });

	$(function(){
		$('#myModal').on("click",'button.logPrint',function(){
			var formData = new FormData();
			formData.append('addDate',reservationDate)
			$('button.btn-danger').each(function(){
				formData.append('open',reservationDate+" "+$(this).find("start").html())
				formData.append('close',reservationDate+" "+$(this).find("end").html())
			})
			console.log("hi : "+formData.getAll('open'))
			$.ajax({
				url:"/beaudafest/reservation/insert",
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				success:function(){
					alert("일정이 추가되었습니다.");
					$('#myModal').modal("hide");
				}
			})
		})
		$('#myModal').on("click",'button.btn-block',function(){
			$(this).toggleClass("btn-danger")
		})
		$('#myModal').on("click",'button.closeModal',function(){
			$('.modal-body').html("");
			$('#myModal').modal("hide");
		})
	})
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
	button.btn{
		border-color: black
	}

</style>
</head>
<body>

  <div id='calendar'></div>
  <div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">일정 등록하기</h4>
	          <button type="button" class="close closeModal" data-dismiss="modal">×</button>
	        </div>
	        <!-- Modal body -->
	        <div class="modal-body">
	        </div>
	        <!-- Modal footer -->
	        <div class="modal-footer">
			  <button type="button" class="btn logPrint">일정 등록</button>
	          <button type="button" class="btn closeModal" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
</body>
</html>