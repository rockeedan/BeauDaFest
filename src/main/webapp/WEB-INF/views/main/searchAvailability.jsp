<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="resources/css/bootstrap.min.css" />

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="resources/css/style.css" />
<script src="resources/js/jquery-3.js"></script>
<title>BEAUDAFEST</title>
</head>
<body>
	<div>
		<%@ include file="../include/nav.jsp"%>
	</div>
	<br>
	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="booking-form">
						<div class="booking-bg">
							<div class="form-header">
								<h2>Make your reservation</h2>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Cupiditate laboriosam numquam at</p>
							</div>
						</div>
						<form action="searchShopList" method="post">

							<div class="form-group">
								<span class="form-label">DATE</span> <input class="form-control"
									type="date" required name="date">

								<div class="form-group">
									<span class="form-label">Time</span> <input
										class="form-control" type="time" required name="time">
								</div>

							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<span class="form-label">시/도</span> <select
											class="form-control" required>
											<option value="" selected hidden>Select</option>
											<option>서울시</option>
											<option>대구광역시</option>
											<option>부산광역시</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<span class="form-label">구/군</span> <select
											class="form-control" required>
											<option value="" selected hidden>Select</option>
											<option>강남구</option>
											<option>서초구</option>
											<option>마포구</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>

								<div class="col-md-4">
									<div class="form-group">
										<span class="form-label">동</span> <select class="form-control"
											required>
											<option value="" selected hidden>Select</option>
											<option>서초동</option>
											<option>잠원동</option>
										</select> <span class="select-arrow"></span>
									</div>
								</div>
							</div>
							<div class="form-btn">
								<button class="submit-btn">Check availability</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>