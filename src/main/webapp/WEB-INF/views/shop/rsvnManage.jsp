<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ////////////////////////////////////////////////////////////// -->
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
<!-- ////////////////////////////////////////////////////////////// -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/dashboard/">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">


<!-- Page level plugin CSS-->
<link href="resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<script src="/beaudafest/resources/js/jquery-3.js"></script>
<script type="text/javascript">

function open_url( type, url, data, target ){ 
	$.ajax({ 
		type: type, 
		url: url, 
		data: data,
		success: function(data){
			$("#"+target).html(data); 
		}
	})
};




</script>
<script type="text/javascript">
var addDateCnt =0;
function open_calender(){
	var calendarEl = document.getElementById('contentDiv');
	$('#contentDiv').html("");
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid'],
      header: {
        left: 'prev,next today',
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
      
      height:660,

      weekNumbers: true,
      weekNumbersWithinDays: true,
      weekNumberCalculation: 'ISO',
      
      dateClick: function(info) {
  	    //alert('Clicked on: ' + info.dateStr);//2019-10-30
  	    alert("hihi : "+ info.view.type);//dayGridMonth,timeGridWeek
  	    alert("dateStr : "+info.dateStr);
  	    alert("dateLength"+info.dateStr.length);
  	    if(info.view.type =="dayGridMonth" || info.dateStr.length<11){
	  	    reservationDate = info.dateStr
	  	    $('.modal-body').html("");
	  	    $.ajax({
	  	    	url:"/beaudafest/reservation/reservationTable",
	  	    	data:{addDate:reservationDate},
	  	    	success:function(result){
	  	    		addDateCnt=0;
			  	    $('.modal-body').html(result);
	  	    	}
	  	    })
	  	    $('#myModal').modal();
  	    }
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
      },color:"#FFC0CB"}],
      eventClick: function(info) {
    	    info.jsEvent.preventDefault();
    	    /*alert('Event: ' + info.event.title);
    	    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    	    alert('View: ' + info.view.type);*/

    	    // change the border color just for fun
    	    //info.el.style.borderColor = 'red';
    	    if(info.event.title =="예약가능"){
    	    	alert("ㅎㅎㅎ 예약취소할 수 있다")
    	    }else{
    	    	alert("예약이 존재해서 일정을 닫을 수 없습니다")
    	    }
    	  }
    });

    calendar.render();
}

$(function(){
	$('#myModal').on("click",'button.logPrint',function(){
		if(addDateCnt==0){
			return;
		}
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
				addDateCnt=0;
				alert("일정이 추가되었습니다.");
				$('#myModal').modal("hide");
			}
		})
	})
	$('#myModal').on("click",'button.btn-block',function(){
		addDateCnt++;
		$(this).addClass("btn-danger")
	})
	$('#myModal').on("click",'button.btn-danger',function(){
		addDateCnt++;
		$(this).removeClass("btn-danger")
	})
	$('#myModal').on("click",'button.closeModal',function(){
		$('.modal-body').html("");
		$('#myModal').modal("hide");
	})
})
</script>

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
<!-- Custom styles for this template -->
<link href="resources/css/dashboard.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../include/ownerNav.jsp"%>
	<%--Nav바 인클루드  --%>

	<br>
	<div class="row">
	<nav class="col-md-2 d-none d-md-block bg-light sidebar">
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">
		
		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item"><span>&nbsp</span></li>
		<li class="nav-item"><span>&nbsp</span></li>
		<li class="nav-item"><span>&nbsp</span></li>
		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Heading -->
		<div class="sidebar-heading">Dashboard</div>
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo"
		aria-expanded="true" aria-controls="collapseTwo"> 
			
		<i class="fas fa-fw fa-cog"></i> <span>Chart</span>
		</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
		<h6 class="collapse-header">차트보기</h6>
		<a class="collapse-item" href="javascript:;" 
			onClick="open_url('get', 'tables','','contentDiv')">RESERVATIONS</a>
		<a class="collapse-item" href="javascript:;" 
			onClick="open_url('get', 'charts','','contentDiv')"> REVENUE</a>
		</div>
		</div>
		</li>
		<li class="nav-item"><a class="nav-link collapsed" href="javascript:;"
			onclick="open_calender()"><span>일정 등록</span></a></li>
	</ul>
	</nav>
	
	<main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
	<br><br>
	<div>
		<div id = "contentDiv">
			하이하이하이하이하이하이하이하이하이하이하이하이하이하이하이
		</div>
	</div>
	
	</main>
	</div>
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
			
			
			





	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin.min.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="resources/js/demo/datatables-demo.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/chart-area-demo.js"></script>
	<script src="resources/js/demo/chart-pie-demo.js"></script>
	<script src="resources/js/demo/chart-bar-demo.js"></script>
</body>
</html>