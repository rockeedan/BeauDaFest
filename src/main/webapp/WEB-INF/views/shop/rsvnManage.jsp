<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- ////////////////////////////////////////////////////////////// -->
<script src="/beaudafest/resources/vendor/jquery/jquery.min.js"></script>
<link href='/beaudafest/resources/css/calendar/packages/core/main.css'
	rel='stylesheet' />
<link
	href='/beaudafest/resources/css/calendar/packages/daygrid/main.css'
	rel='stylesheet' />
<link
	href='/beaudafest/resources/css/calendar/packages/timegrid/main.css'
	rel='stylesheet' />
<link href='/beaudafest/resources/css/calendar/packages/list/main.css'
	rel='stylesheet' />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src='/beaudafest/resources/css/calendar/packages/core/main.js'></script>
<script
	src='/beaudafest/resources/css/calendar/packages/interaction/main.js'></script>
<script
	src='/beaudafest/resources/css/calendar/packages/daygrid/main.js'></script>
<script
	src='/beaudafest/resources/css/calendar/packages/timegrid/main.js'></script>
<script src='/beaudafest/resources/css/calendar/packages/list/main.js'></script>
<!-- ////////////////////////////////////////////////////////////// -->


<!-- Custom fonts for this template -->
<link
	href="/beaudafest/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/beaudafest/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Page level plugin CSS-->
<link
	href="/beaudafest/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<script type="text/javascript">
	function open_url(type, url, target) {
		$.ajax({
			type : type,
			url : url,
			success : function(data) {
				$("#" + target).html(data);
			}
		})
	};
</script>
<script type="text/javascript">
	var addDateCnt = 0;
	var calendar;
	var reservationDate;

	function getEventDate(date) {
		var year = date.getFullYear();//yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		var hour = date.getHours();
		hour = hour >= 10 ? hour : '0' + hour; //day 두자리로 저장
		var min = date.getMinutes();
		min = min >= 10 ? min : '0' + min; //day 두자리로 저장
		return year + '/' + month + '/' + day + " " + hour + ":" + min;
	}

	function getEndTimeDate(date) {
		var year = date.getFullYear();//yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		var min = date.getMinutes() + 30;
		var hour = date.getHours();
		if (min == 60) {
			min = "00";
			hour += 1;
		} else if (hour == 24) {
			hour = 23;
			min = 59;
		}
		hour = hour >= 10 ? hour : '0' + hour; //day 두자리로 저장
		return year + '/' + month + '/' + day + " " + hour + ":" + min;
	}
	function getCloseTime(date) {
		var min = date.getMinutes() + 30;
		var hour = date.getHours();
		if (min == 60) {
			min = "00";
			hour += 1;
		} else if (hour == 24) {
			hour = 23;
			min = 59;
		}
		hour = hour >= 10 ? hour : '0' + hour; //day 두자리로 저장
		return hour + ":" + min;
	}

	function open_calender(shopNum) {
		var calendarEl = document.getElementById('contentDiv');
		$('#contentDiv').html("");
		calendar = new FullCalendar.Calendar(
				calendarEl,
				{
					plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
					header : {
						left : 'prev,next',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek'
					},
					navLinks : true, // can click day/week names to navigate views

					validRange : function() {
						var nowDate = new Date();
						return {
							start : nowDate.setDate(nowDate.getDate() + 1),
							end : new Date().setMonth(nowDate.getMonth() + 2)
						}
					},

					height : 660,

					weekNumbers : true,
					weekNumbersWithinDays : true,
					weekNumberCalculation : 'ISO',

					dateClick : function(info) {
						//alert('Clicked on: ' + info.dateStr);//2019-10-30
						//timeGridWeek : 2019-10-30T09:00:00+09:00 //25
						alert("hihi : " + info.view.type);//dayGridMonth,timeGridWeek
						alert("dateStr : " + info.dateStr);
						alert("dateLength" + info.dateStr.length);
						if (info.view.type == "dayGridMonth"
								|| info.dateStr.length < 11) {
							reservationDate = info.dateStr
							$('.modal-body').html("");
							$
									.ajax({
										url : "/beaudafest/reservation/reservationTable",
										data : {
											addDate : reservationDate
										},
										success : function(result) {
											addDateCnt = 0;
											$('.modal-body').html(result);
										}
									})
							$('#myModal').find('button.logPrint').attr('shopNum',shopNum);
							$('#myModal').modal();
						} else {
							var cntTimeSchedule = 1;
							$
									.ajax({
										url : "/beaudafest/reservation/countTimeSchedule",
										data : {
											shopNum : shopNum,
											addDate : info.dateStr
													.substr(0, 10),
											startTime : info.dateStr.substr(0,
													16)
										},
										dataType : "JSON",
										success : function(result) {
											console.log()
											if (result == 0) {
												if (confirm("일정을 추가하시겠습니까?")) {
													var formData = new FormData();
													var addDate = info.dateStr
															.substr(0, 10);
													var open = getEventDate(info.date);
													var close = getEndTimeDate(info.date);
													formData.append("shopNum",
															shopNum);
													formData
															.append(
																	"addDate",
																	info.dateStr
																			.substr(
																					0,
																					10));
													formData
															.append(
																	"open",
																	getEventDate(info.date));
													formData
															.append(
																	"close",
																	getEndTimeDate(info.date));
													console.log(formData
															.get("open"))
													$
															.ajax({
																url : "/beaudafest/reservation/insert",
																processData : false,
																contentType : false,
																data : formData,
																type : 'POST',
																success : function() {
																	alert("일정이 추가되었습니다.");
																	calendar
																			.addEventSource([ {
																				title : '예약가능',
																				start : info.dateStr
																						.substr(
																								0,
																								16),//getEventDate(info.date),
																				end : info.dateStr
																						.substr(
																								0,
																								10)
																						+ "T"
																						+ getCloseTime(info.date),//getEndTimeDate(info.date),
																				color : "#FFC0CB"
																			} ])
																}
															})
												}
											}
										}
									})
							/*
								var formData = new FormData();
								$.ajax({
								url:"/beaudafest/reservation/insert",
								processData:false,
								contentType:false,
								data:{addDate:info.dateStr.substr(0,10),
									open:info.dateStr.substr(0,16)},
								type:'POST',
								success:function(){
									alert("일정이 추가되었습니다.");
								}
							}) */
						}
					},

					editable : false,
					eventLimit : true, // allow "more" link when too many events
					//eventSources:[{events:event}]
					/* eventSources:{url:"/beaudafest/reservation/eventTest",
					  color:'yellow',
					  textColor:'black'} */
					eventSources : [ {
						events : function(info, successCallback,
								failureCallback) {
							$.ajax({
								url : "/beaudafest/reservation/eventTest",
								data:{shopNum:shopNum},
								dataType : 'json',
								success : function(data) {
									successCallback(data);
								}
							})
						},
						color : "#FFC0CB"
					} ],
					eventClick : function(info) {
						info.jsEvent.preventDefault();
						/*alert('Event: ' + info.event.title);
						alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
						alert('View: ' + info.view.type);*/

						// change the border color just for fun
						//info.el.style.borderColor = 'red';
						if (info.event.title == "예약가능") {
							alert("ㅎㅎㅎ 예약취소할 수 있다")
							alert(getEventDate(info.event.start))//Fri Oct 25 2019 10:00:00 GMT+0900 (한국 표준시)
							if (confirm("예약을 삭제하시겠습니까")) {
								var eventDate = getEventDate(info.event.start);
								$
										.ajax({
											url : "/beaudafest/reservation/eventDelete",
											data : {
												shopNum : shopNum,
												addDate : eventDate.substr(0,
														10),
												startTime : eventDate.substr(0,
														16)
											},
											type : 'POST',
											success : function(result) {
												if (result) {
													alert("일정이 닫혔습니다");
													info.event.remove();
												} else {
													alert("일정을 닫을 수 없습니다");
												}
											}
										})
							}
						} else {
							alert("예약이 존재해서 일정을 닫을 수 없습니다")
						}
					}
				});

		calendar.render();
	}
	function eventCheck() {
		calendar.refetchEvents()
	}

	$(
			function() {
				$('#myModal').on(
						"click",
						'button.logPrint',
						function() {
							if (addDateCnt == 0) {
								return;
							}
							var formData = new FormData();
							formData.append('shopNum', $(this).attr('shopNum'))
							formData.append('addDate', reservationDate)
							$('button.btn-danger').each(
									function() {
										formData.append('open', reservationDate
												+ " "
												+ $(this).find("start").html())
										formData.append('close',
												reservationDate
														+ " "
														+ $(this).find("end")
																.html())
									})
							console.log("hi : " + formData.getAll('open'))
							$.ajax({
								url : "/beaudafest/reservation/insert",
								processData : false,
								contentType : false,
								data : formData,
								type : 'POST',
								success : function() {
									alert("일정이 추가되었습니다.");
									$('button.btn-danger').each(
											function() {
												calendar.addEventSource([ {
													title : '예약가능',
													start : reservationDate
															+ " "
															+ $(this).find(
																	"start")
																	.html(),
													end : reservationDate
															+ " "
															+ $(this).find(
																	"end")
																	.html(),
													color : "#FFC0CB"
												} ])
											})
									addDateCnt = 0;
									$('#myModal').modal("hide");
								}
							})
						})
				$('#myModal').on("click", 'button.btn-block', function() {
					addDateCnt++;
					$(this).addClass("btn-danger")
				})
				$('#myModal').on("click", 'button.btn-danger', function() {
					addDateCnt++;
					$(this).removeClass("btn-danger")
				})
				$('#myModal').on("click", 'button.closeModal', function() {
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

</head>
<body>

	<c:choose>
		<c:when test="${memberStatus eq null}">
			<%@ include file="../include/nav.jsp"%>
		</c:when>
		<c:when test="${memberStatus eq 0}">
			<%-- 일반회원일때 --%>
			<%@ include file="../include/memberNav.jsp"%>
		</c:when>
		<c:when test="${memberStatus eq 1}">
			<%-- 오너회원일때 --%>
			<%@ include file="../include/ownerNav.jsp"%>
		</c:when>
		<c:otherwise>
			<%-- 회원이아닐때 (로그인X) --%>
			<%@ include file="../include/nav.jsp"%>
		</c:otherwise>
	</c:choose>

	<br>
	<div class="row">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<ul
				class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
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
				<div class="sidebar-heading">SHOP LIST</div>
				<!-- Nav Item - Pages Collapse Menu -->


				<!-- 샵 목록 -->
				<c:forEach items="${shopList }" var="shopList">
					<li class="nav-item"><a class="nav-link collapsed" href="#"
						data-toggle="collapse"
						data-target="#collapseTwo${shopList.shopNum}" aria-expanded="true"
						aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i>
							<span>${shopList.shopName}</span>
					</a>

						<div id="collapseTwo${shopList.shopNum}" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<h6 class="collapse-header">차트보기</h6>
								<a class="collapse-item" href="javascript:;"
									onClick="open_url('get', 'tables/${shopList.shopNum}','contentDiv')">RESERVATIONS</a>
								<a class="collapse-item" href="javascript:;"
									onClick="open_url('get', 'charts/${shopList.shopNum}','contentDiv')">
									REVENUE</a>
								<a class="collapse-item" href="javascript:;" onclick="open_calender(${shopList.shopNum})">일정등록</a>
							</div>

						</div></li>

				</c:forEach>

			</ul>
		</nav>
		 
		
		<main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
		<br>
		<br>
		<div>
			<div id="contentDiv"></div>
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
				<div class="modal-body"></div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn logPrint" shopNum="0">일정 등록</button>
					<button type="button" class="btn closeModal" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script
		src="/beaudafest/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!--Core plugin JavaScript-->
	<script
		src="/beaudafest/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!--Custom scripts for all pages-->
	<script src="/beaudafest/resources/js/sb-admin.min.js"></script>

	
</body>
</html>