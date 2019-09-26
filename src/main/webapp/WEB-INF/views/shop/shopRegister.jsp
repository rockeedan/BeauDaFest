<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="resources/img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/font/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div>
		<%@ include file="../include/nav.jsp"%>
	</div>
	<br>
	<br>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26"> Welcome </span> <span
						class="login100-form-title p-b-26"> <strong>BEAUDA</strong><img
						src="resources/img/heart.png" width="30" height="30"
						class="d-inline-block align-top" alt=""> FEST
					</span> <span class="login100-form-title p-b-26"> Shop Register</span>


					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="shopName"> <span
							class="focus-input100" data-placeholder="Shop Name"></span>
					</div>



					<div class="wrap-input100 validate-input">
						<input class="input100" type="tel" name="shopTel"> <span
							class="focus-input100" data-placeholder="Shop 전화번호"></span>
					</div>

					Shop 주소
					<hr>

					<div class="row">

						<div class="col-md-4">

							<div class="form-group">
								<select class="input100" required>
									<option>select</option>
									<option>서울시</option>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<select class="input100" required>
									<option>select</option>
									<option>강남구</option>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<select class="input100" required>
									<option>select</option>
									<option>서초동</option>
								</select>
							</div>
						</div>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="shopAddr"> <span
							class="focus-input100" data-placeholder="상세주소"></span>
					</div>


					Shop 시작시간
					<div class="wrap-input100 validate-input">
						<input class="input100" type="time" name="startTime">
					</div>

					Shop 종료시간
					<div class="wrap-input100 validate-input">
						<input class="input100" type="time" name="endTime">
					</div>

					Shop 휴무요일
					<hr>

					<div class="form-group row">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox1" value="option1"> <label
								class="form-check-label" for="inlineCheckbox1">월</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">화</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">수</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">목</label>
						</div>
					</div>
					<div class="form-group row">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">금</label>
						</div>

						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">토</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="inlineCheckbox2" value="option2"> <label
								class="form-check-label" for="inlineCheckbox2">일</label>
						</div>
					</div>
					<br> 주차유무
					<hr>

					<div class="form-group">
						<select class="input100" required>
							<option>select</option>
							<option>없음</option>
							<option>1대 이상</option>
							<option></option>
						</select>
					</div>
					<br> 취소 정책
					<hr>

					<div class="form-group">
						<select class="input100" required>
							<option>select</option>
							<option>하루전날까지</option>
							<option>취소불가</option>
							<option></option>
						</select>
					</div>
						<br>
					Shop사진
					<hr>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input"
								id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
							<label class="custom-file-label" for="inputGroupFile01">Choose
								file</label>
						</div>
					</div>
					
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">Sign Up</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1"> Do you have an account? </span> <a
							class="txt2" href="#"> Log In </a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>


</body>
</html>