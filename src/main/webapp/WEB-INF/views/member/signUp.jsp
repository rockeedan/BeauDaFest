<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Custom fonts for this template-->
<link href="/beaudafest/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/beaudafest/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="/beaudafest/resources/js/jquery-3.js"></script>
<script>
	$(function() {
		$('#signUpbutton').click(function() {
			if ($('#memberStatus').val() == 1) {
				$('#frm').attr('action', 'ownerSignUp');
				$('#frm').submit();
			} else {
				$('#frm').submit();
			}
		})
	});
</script>
<body class="bg-gradient-primary">
	<div>
		<%@ include file="../include/nav.jsp"%>
	</div>
	<br>
	<br>
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">
									<span class="login100-form-title p-b-26"> Welcome To </span> <span
										class="login100-form-title p-b-26"> <strong>BEAUDA</strong><img
										src="resources/img/heart.png" width="30" height="30"
										class="d-inline-block align-top" alt=""> FEST
									</span>
								</h1>
							</div>
							<form id="frm" action="signUp" method="post">
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="exampleId" placeholder="ID" name="memberId">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="exampleName" placeholder="Name" name="memberName">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="Email Address" name="memberEmail">
								</div>
								<div class="form-group">
									<input type="tel" class="form-control form-control-user"
										id="examplePhoneNumber" placeholder="Phone Number" name="memberPhone">
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" placeholder="Password"
											name="memberPass">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="exampleRepeatPassword" placeholder="Repeat Password"
											name="memberPassCheck">
									</div>
								</div>
								
								<button id="signUpbutton" class="btn btn-primary btn-user btn-block"
									type="button">Sign Up</button>
								<hr>
								<input type="hidden" id="memberStatus" name="memberStatus"
									value="${memberStatus }">

							</form>

							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot
									Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/beaudafest/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/beaudafest/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/beaudafest/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/beaudafest/resources/js/sb-admin-2.min.js"></script>



</body>
</html>