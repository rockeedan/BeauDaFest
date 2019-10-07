<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="resources/img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/font/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/beaudafest/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/beaudafest/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/beaudafest/resources/css/main.css">
<!--===============================================================================================-->
</head>
<script src='/beaudafest/resources/js/jquery.min.js'></script>
<script>
	$(function(){
		$('#signUpbutton').click(function(){
			if($('#memberStatus').val()==1){
				$('.validate-form').attr('action','ownerJoin');
				$('.validate-form').submit();
			} else {
				$('.validate-form').submit();
			}
		})
	});
</script>
<body>
	<div>
		<%@ include file="../include/nav.jsp"%>
	</div>
	<br><br>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="userJoin" method="post">
					<span class="login100-form-title p-b-26"> Welcome </span> <span
						class="login100-form-title p-b-26"> <strong>BEAUDA</strong><img
						src="/beaudafest/resources/img/heart.png" width="30" height="30"
						class="d-inline-block align-top" alt=""> FEST
					</span>


					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="memberId"> <span
							class="focus-input100" data-placeholder="ID"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
						</span> <input class="input100" type="password" name="memberPass"> <span
							class="focus-input100" data-placeholder="Password"></span>

					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
						</span> <input class="input100" type="password" name="memberPassCheck">
						<span class="focus-input100" data-placeholder="Password Check"></span>

					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="memberName"> <span
							class="focus-input100" data-placeholder="Name"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is: a@b.c">
						<input class="input100" type="text" name="memberEmail"> <span
							class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="memberPhone"> <span
							class="focus-input100" data-placeholder="Phone Number"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="signUpbutton" type="button">Sign Up</button>
						</div>
					</div>


					<div class="text-center p-t-115">
						<span class="txt1"> Do you have an account? </span> <a
							class="txt2" href="#"> Log In </a>
					</div>
					<input type="hidden" id="memberStatus" name="memberStatus" value="${memberStatus }">
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/beaudafest/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/beaudafest/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/beaudafest/resources/js/main.js"></script>


</body>
</html>