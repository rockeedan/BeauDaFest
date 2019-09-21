<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/navbar-fixed/">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">




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
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">BEAUDA <img
			src="resources/img/heart.png" width="30" height="30"
			class="d-inline-block align-top" alt=""> FEST
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">HOME
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">MYPAGE</a> <!-- 로그인 하면  MyPage로바뀌기 (회원정보수정,탈퇴)  -->
				</li>
				<li class="nav-item"><a class="nav-link" href="#">RESERVATION</a>
					<!-- 예약확인하기  --></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
					<!-- 선택되면 disabled로?? --></li>
				<li class="nav-item"><a class="nav-link" href="#">LOG IN</a> <!-- 로그인 안됐을 시 뜨는 화면  -->
				</li>
			</ul>
			<form class="form-inline mt-2 mt-md-0">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="#">Shop등록</a> <!-- 선택되면 disabled로?? -->
					</li>
				</ul>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign
					Up</button>
			</form>
		</div>
	</nav>

</body>
</html>