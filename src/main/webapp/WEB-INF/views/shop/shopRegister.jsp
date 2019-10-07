<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.js"></script>
<script type="text/javascript">
	$(function() {
		$('#signUp').click(
				function() {
					//휴무일
					var shopOff = "";
					var check = $("input[name=shopOffCheck]:checked");
					check.each(function(idx, size) {
						if (idx == (check.length - 1)) {
							shopOff += $(this).val();
						} else {
							shopOff += $(this).val() + ",";
						}
					});
					$('#shopOff').val(shopOff);

					//샵 주소
					var shopAddr = "";
					var addr = $("select[name=shopAddrBox] option:selected");
					addr.each(function(idx, size) {
						if (idx < addr.length - 1) {
							shopAddr += $(this).val() + " ";
						} else {
							shopAddr += $(this).val() + " "
									+ $("input[name=shopAddrDetail]").val();
						}
					});
					$('#shopAddr').val(shopAddr);
					$('.validate-form').submit();
				});
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
							<form class="user" action="shopJoin" method="post">
								<div class="form-group">
									<input type="text" class="form-control" id="exampleShopName"
										placeholder="Shop Name" name="shopName">
								</div>

								<div class="form-group">
									<input type="tel" class="form-control" id="exampleInputPhone"
										placeholder="Phone Number">
								</div>
								<div class="form-group row">
									<!-- 주소는 추후 db 사용할것임  -->
									<div class="col-sm-4 mb-3 mb-sm-0">
										<select class="form-control">
											<option disabled selected>시/도</option>
											<option>서울시</option>
										</select>
									</div>
									<div class="col-sm-4">
										<select class="form-control">
											<option disabled selected>구/군</option>
											<option>강남구</option>
											<option>서초구</option>
											<option>마포구</option>
										</select>
									</div>
									<div class="col-sm-4">
										<select class="form-control">
											<option disabled selected>동/읍/면</option>
											<option>서초동</option>
											<option>합정동</option>
											<option>개포동</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="exampleInputAddr"
										placeholder="상세주소">
								</div>
								<div class="text-center">
									<h6 class="h6 text-gray-900 mb-4">Shop운영시간/휴무(선택)</h6>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="time" class="form-control" id="exampleStartTime">
										</div>
										<div class="col-sm-6">
											<input type="time" class="form-control" id="exampleEndTime">
										</div>
									</div>
								</div>
								<!-- 휴무요일선택 -->
								<div class="form-group">
									<div class="form-control">
										<div class="text-center">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox1" value="월" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox1">월</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox2" value="화" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">화</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox2" value="수" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">수</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox2" value="목" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">목</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox2" value="금" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">금</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox2" value="토" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">토</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="checkbox"
													id="inlineCheckbox2" value="일" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">일</label>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<select class="form-control" required name="shopParking">
										<option disabled selected>Parking</option>
										<option value="0">없음</option>
										<option value="1">1대 이상</option>
									</select>
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroupFileAddon01">ShopPhoto</span>
									</div>
									<div class="custom-file">
										<input type="file" class="custom-file-input"
											id="inputGroupFile01"
											aria-describedby="inputGroupFileAddon01"> <label
											class="custom-file-label" for="inputGroupFile01">jpg,jpeg,bmp,png</label>
									</div>
								</div>

								<div class="form-group">

									<textarea class="form-control" id="shopIntro" rows="3"
										name="shopIntro" placeholder="Shop소개"></textarea>
								</div>


								<button id="signUpbutton"
									class="btn btn-primary btn-user btn-block" type="button">Shop
									Register</button>
								<hr>
								<input type="hidden" id="memberStatus" name="memberStatus"
									value="${memberStatus }"> <input type="hidden"
									name="shopOff" id="shopOff" value=""> <input
									type="hidden" name="shopAddr" id=shopAddr value="">
							</form>

						</div>
					</div>
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
	<script src="resources/js/sb-admin-2.min.js"></script>


</body>
</html>