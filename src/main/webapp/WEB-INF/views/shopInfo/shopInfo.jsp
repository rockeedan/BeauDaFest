<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/carousel/">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


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
<link href="resources/css/carousel.css" rel="stylesheet">
</head>
<body>
	<div>
		<%@ include file="../include/nav.jsp"%>
		<%--Nav바 인클루드  --%>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<section class="jumbotron text-center"
			style="background-color: #fbceb1">
			<div class="container">
				<h1 class="jumbotron-heading">NAMDAREUM</h1>
				<%--샵이름  --%>
				<p class="lead text-muted">최고의 디자인이 어쩌고 블라 샵 코멘트</p>
				<%--샵소개 코멘트  --%>

			</div>
		</section>
		<!-- 메뉴 NAV -->
		<div class="nav-scroller py-1 mb-2">

			<nav class="nav d-flex justify-content-between">
				<a class="p-2 text-muted" href="#">INFO</a> <a
					class="p-2 text-muted" href="#">COUPON</a> <a
					class="p-2 text-muted" href="#">REVIEW</a>
			</nav>
		</div>
		<hr>
		<div class="container marketing">


			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Shop이름 <br><span class="text-muted">shop주소</span>
					</h2>
					<p class="lead">shop소개글</p>
					<p class="lead">shop운영시간</p>
					<p class="lead">shop휴일</p>
					<p class="lead">shop주차유무</p>
				</div>
				<div class="col-md-5">
					<!-- 디자인 사진 캐러셀 -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<svg class="bd-placeholder-img" width="100%" height="100%"
									xmlns="http://www.w3.org/2000/svg"
									preserveAspectRatio="xMidYMid slice" focusable="false"
									role="img">
												<rect width="100%" height="100%" fill="#777" /></svg>
								<div class="container">
									<div class="carousel-caption text-left">
										<h1>사진1</h1>

									</div>
								</div>
							</div>

							<div class="carousel-item">
								<svg class="bd-placeholder-img" width="100%" height="100%"
									xmlns="http://www.w3.org/2000/svg"
									preserveAspectRatio="xMidYMid slice" focusable="false"
									role="img">
												<rect width="100%" height="100%" fill="#777" /></svg>
								<div class="container">
									<div class="carousel-caption">
										<h1>사진2</h1>

									</div>
								</div>
							</div>
							<div class="carousel-item">
								<svg class="bd-placeholder-img" width="100%" height="100%"
									xmlns="http://www.w3.org/2000/svg"
									preserveAspectRatio="xMidYMid slice" focusable="false"
									role="img">
												<rect width="100%" height="100%" fill="#777" /></svg>
								<div class="container">
									<div class="carousel-caption text-right">
										<h1>사진3</h1>
									</div>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#myCarousel" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#myCarousel" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
					<!-- 디자인 사진 캐러셀 끝-->
				</div>
			</div>
			<hr>
			<!-- /END THE FEATURETTES -->
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>