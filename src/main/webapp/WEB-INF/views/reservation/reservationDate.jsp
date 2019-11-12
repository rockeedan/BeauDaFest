<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- //////////////////////////////////////////////// -->	
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
<!-- //////////////////////////////////////////////// -->	

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<script type="text/javascript">
function sendPost(action, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', action);
	for ( var key in params) {
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', key);
		hiddenField.setAttribute('value', params[key]);
		form.appendChild(hiddenField);
	}
	document.body.appendChild(form);
	form.submit();
}
$(function(){
	var calendarEl = document.getElementById('contentDiv');
	$('#contentDiv').html("");
    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid'],
      defaultView:'timeGridWeek',
      header: {
        left: 'prev,next',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      
      validRange: function() {
    	  var nowDate = new Date();  
    	    return {
    	        start: nowDate.setDate(nowDate.getDate()+1),
    	        end: new Date().setMonth(nowDate.getMonth()+2)
    	      }
      },
      

      weekNumbers: true,
      weekNumbersWithinDays: true,
      weekNumberCalculation: 'ISO',
      
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      //eventSources:[{events:event}]
      /* eventSources:{url:"/beaudafest/reservation/eventTest",
    	  color:'yellow',
    	  textColor:'black'} */
//////////////////////////////////////////////////////////////////////////////////////일정 가져오기
	  eventSources:[{events:function(info, successCallback, failureCallback){
			$.ajax({
				url:"/beaudafest/reservation/reservationEvent",
				data:{shopNum:1,
					rsvnTime:60},
				type:"POST",
				dataType:'JSON',
				success:function(data){
					successCallback(data);
				}
			})
      },color:"#FFC0CB"}],
//////////////////////////////////////////////////////////////////////////////////////일정 가져오기
      eventClick: function(info) {
    	    info.jsEvent.preventDefault();
    	    /*alert('Event: ' + info.event.title);
    	    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    	    alert('View: ' + info.view.type);*/

    	    // change the border color just for fun
    	    //info.el.style.borderColor = 'red';
//////////////////////////////////////////////////////////////////////////////////////일정 등록
    	    if(info.event.title =="예약가능"){
    	    	var eventDate = new Date(info.event.start);
    	    	console.log(eventDate);
    	    	var monthCheck = eventDate.getMonth()<10 ? "0"+eventDate.getMonth():""+eventDate.getMonth();
    	    	var dateCheck = eventDate.getDate()<10 ? "0"+eventDate.getDate():""+eventDate.getDate();
    	    	var hoursCheck = eventDate.getHours()<10 ? "0"+eventDate.getHours():""+eventDate.getHours();
    	    	var minutesCheck = eventDate.getMinutes()==0 ? "00":"30";
    	    	
    	    	if(confirm(monthCheck+"월 "+dateCheck+"일 "+
    	    			hoursCheck+":"+minutesCheck+" 에 예약하시겠습니까?")){
    	    			var params = {
    	    				"shopNum":1,
   	        				"designId":1,
   	        				"bookingDate":eventDate.getFullYear()+"/"+monthCheck+"/"+dateCheck,
   	        				"rsvnDate":eventDate.getFullYear()+"/"+monthCheck+"/"+dateCheck+" "+
   	        				hoursCheck+":"+minutesCheck,
   	        				"rsvnTime":60,
   	        				"designId2":"이런디자인"
    	    			};
    	    		sendPost("/beaudafest/confirm", params);
    	    	}
    	    }
//////////////////////////////////////////////////////////////////////////////////////일정 등록
    	  }
    });
    calendar.render();	
})
</script>

</head>
<div>
	<%@ include file="../include/nav.jsp"%>
</div>
<br><br><br>
<body class="bg-light">
	<div class="container">
		<section class="jumbotron text-center"  style="background-color: #fbceb1">
			<div class="container">
				<h1 class="jumbotron-heading">NAMDAREUM</h1>
				<!-- 샵 이름 -->
				<p class="lead text-muted">최고의 디자인이 어쩌고 블라 샵 코멘트</p> 
			</div>
		</section>
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-secondary badge-pill">2</span>	<!-- 디자인(쿠폰) 선택 갯수  -->
				
				</h4>
				<ul class="list-group mb-3">
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<strong>디자인 이름</strong>
							</h6>
							<small class="text-muted">시술시간</small>
						</div> <span class="text-muted">가격</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<strong>옵션이름</strong>
							</h6>
							<small class="text-muted">시술시간</small>
						</div> <span class="text-muted">가격</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<strong>예약날짜</strong>
							</h6>

						</div> <span class="text-muted">날짜/시간</span>
					</li>

					<li class="list-group-item d-flex justify-content-between"><span>Total
							(KRW)</span><small class="text-muted">총 시술시간</small> <strong>총가격</strong></li>
				</ul>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">예약 날짜 확인</h4>
				<div id="contentDiv"></div>
				<button class="btn btn-primary btn-lg btn-block" type="submit">돌아가기</button>
			</div>
		</div>
	</div>

</body>


</html>