<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
	<div>
		<%@ include file="../include/nav.jsp"%>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<section class="jumbotron text-center"  style="background-color: #fbceb1">
			<div class="container">
				<h1 class="jumbotron-heading">NAMDAREUM</h1>
				<p class="lead text-muted">최고의 디자인이 어쩌고 블라 샵 코멘트</p>
			</div>
		</section>


		<div class="nav-scroller py-1 mb-2">
			<div class="col-md-4">

				<nav class="nav d-flex justify-content-between">
					<a class="p-2 text-muted" href="#">INFO</a> <a
						class="p-2 text-muted" href="#">COUPON.</a> <a
						class="p-2 text-muted" href="#">REVIEW</a>

				</nav>
			</div>
		</div>


		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMid slice" focusable="false"
								role="img" aria-label="Placeholder: Thumbnail">
								<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">
								<h2>ShopName</h2>
								샵설명
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<!--  고객이 로그인 했을 경우 View 버튼만 보임 
									
									
									 -->
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">View</button>

									</div>
									<small class="text-muted">9 mins</small>
									<!-- 소요시간 -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMid slice" focusable="false"
								role="img" aria-label="Placeholder: Thumbnail">
								<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">
								<h2>ShopName</h2>
								샵설명
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">View</button>

									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMid slice" focusable="false"
								role="img" aria-label="Placeholder: Thumbnail">
								<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">
								<h2>ShopName</h2>
								샵설명
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">View</button>

									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- Coupon Detail The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">꿈꾸는 네일 디자인</h4>
								<!-- 디자인이름 -->
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
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
									<a class="carousel-control-prev" href="#myCarousel"
										role="button" data-slide="prev"> <span
										class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next" href="#myCarousel"
										role="button" data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>

								<form>
									<div class="form-group">
										<label for="designName" class="col-form-label">디자인 이름:</label>
										<input type="text" class="form-control" id="designName">
									</div>
									<div class="form-group">
										<label for="designTime" class="col-form-label">시술시간: </label>
										<input type="text" class="form-control" id="designTime">
									</div>
									<div class="form-group">
										<label for="designPrice" class="col-form-label">디자인
											가격:</label> <input type="text" class="form-control" id="designPrice">
									</div>
									<div class="form-group">
										<label for="designText" class="col-form-label">디자인설명:</label>
										<textarea class="form-control" id="message-text"></textarea>
									</div>
								</form>

							</div>
							<!-- Modal footer -->
							<!-- 일반고객 로그인 시 닫기버튼만 활성화,
							샵주인 로그인 시 사진 수정 및 삭제 가능 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-success"
								data-dismiss="modal">예약하기</button>
							</div>

						</div>
					</div>
				</div>
				<!-- </Modal> -->

			</div>
		</div>


		<p class="text-center">
			<a href="#" class="btn btn-outline-primary my-2" data-toggle="modal"
				data-target="#myModal">View More</a>
		</p>



	</div>



</body>
</html>
