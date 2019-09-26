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
<script type="text/javascript">
	var formData = new FormData(); //Ajax로 전달할 전체데이터 
	var regex = new RegExp("(.*?)\.(zip|exe|pdf|sh|alz)$"); //해당파일 첨부 불가능 
	function fileCheck(fileName) {
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다")
			$("input[name='uploadCoupon']").focus();
			return false;
		}
		return true;
	}

	$(function() {

		$("#addCoupon").on("click", function() { //ADD COUPON (쿠폰등록) 버튼을 클릭했을 시, 
			var inputFile = $("input[name='uploadCoupon']"); //입력된 파일
			var files = inputFile[0].files;
			formData.append("designName", $("#addName").val()) //쿠폰이름 
			formData.append("designTime", $("#addTime option:selected").val()) //시술시간 
			formData.append("designPrice", $("#addPrice").val()) //시술가격 
			formData.append("designType", $("#addType option:selected").val()) //네일,페디,속눈썹선택 
			formData.append("designOption", $("#addOption").val()) //디자인 or 단순 시술 

			for (var i = 0; i < files.length; i++) {

				if (!fileCheck(files[i].name)) {
					return false;
				}
				formData.append("uploadCoupon", files[i]); //선택된 파일 
			}

			$.ajax({
				url : '../owner/addCoupon',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST'

			})

			$("input[name='uploadCoupon']").on("click", function() {

			})

		})

		/* $(".custom-file-input").on("change",function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected")
							.html(fileName);
				}); //파일명 입력해주기 
		 */
	})//ready
</script>
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
					class="p-2 text-muted" href="#">REVIEW</a> <a
					class="p-2 text-muted" href="#">AVAILABILITY</a> <a
					class="p-2 text-muted" href="#">RESERVATION</a>
			</nav>
		</div>

		<%--디자인리스트 보여주기  --%>
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
									샵주인 (if 해당 샵의 샵주인이 맞다면) edit 버튼 보임, edit 누르면 모달창 뜨고 사진 수정 삭제 가능
									
									 -->
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
									<!-- 소요시간 -->
								</div>
							</div>
						</div>
					</div>
					<%--첫번째카드 끝 --%>
					<%--두번째 카드 시작 --%>
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
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<%--두번째 카드 끝 --%>
					<%--세번째 카드 시작 --%>
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
										<%--디자인수디테일보기--%>
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#myModal">Edit</button>
										<%--디자인수정 --%>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<%--세번째 카드 끝 --%>
				</div>
				<%--/row --%>


				<!-- 카드의 View or Edit 클릭 시 /Coupon Detail The Modal -->
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
								<!-- 디자인 사진 캐러셀 끝-->

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

								</form>

							</div>
							<!-- Modal footer -->
							<!-- 일반고객 로그인 시 닫기버튼만 활성화,
							샵주인 로그인 시 사진 수정 및 삭제 가능 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" name="modalClose">Close</button>

								<button type="button" class="btn btn-primary"
									data-dismiss="modal" name="modalModify">Modify</button>

								<button type="button" class="btn btn-danger"
									data-dismiss="modal" name="modalDelete">Delete</button>
							</div>

						</div>
					</div>
				</div>
				<!-- </Modal> -->
			</div>
		</div>


		<p class="text-center">
			<a href="#" class="btn btn-outline-primary my-2">View More</a>
			<%--상품카드 더 보기 --%>
		</p>

		<!-- 샵주인 로그인 시 버튼 활성화 (상품등록가능)  -->
		<p class="text-center">
			<a href="#" class="btn btn-outline-danger my-2" data-toggle="modal"
				data-target="#exampleModalCenter">Add More</a>
		</p>


		<!-- 디자인 추가 모달 -->
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">시술추가하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">

						<form method="post" id="couponDetailAdd" role="form">
							<div class="form-group">
								<label for="Design-name" class="col-form-label">디자인 이름:</label>
								<input type="text" class="form-control" name="designName"
									id="addName">
							</div>
							<div class="form-group">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">시간</label>
									</div>
									<select class="custom-select" name="designTime" id="addTime">
										<option disabled selected>분</option>
										<option value="60">60</option>
										<option value="90">90</option>
										<option value="120">120</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="Design-price" class="col-form-label">가격 :</label> <input
									type="text" class="form-control" name="designPrice"
									id="addPrice">
							</div>

							<div class="form-group">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">상품타입</label>
									</div>
									<select class="custom-select" name="designType" id="addType">
										<option disabled selected>선택</option>
										<option value="네일">네일</option>
										<option value="네일">페디</option>
										<option value="속눈썹">속눈썹</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect02">타입</label>
									</div>
									<select class="custom-select" name="designOption"
										id="addOption">
										<option disabled selected>선택</option>
										<option value="디자인">디자인</option>
										<option value="옵션">시술</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
									</div>
									<div class="custom-file">
										<input type="file" class="custom-file-input"
											id="inputGroupFile01"
											aria-describedby="inputGroupFileAddon01" name="uploadCoupon"
											multiple="multiple"> <label class="custom-file-label"
											for="inputGroupFile01">Choose file</label>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" id='myModalBye'>Close</button>
						<button type="button" class="btn btn-primary" id="addCoupon"
							data-dismiss="modal">Add</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 디자인 추가 모달 끝-->
	</div>
</body>
</html>
