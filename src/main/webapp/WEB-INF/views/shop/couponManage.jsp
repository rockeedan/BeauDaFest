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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"
	integrity="sha384-KA6wR/X5RY4zFAHpv/CnoG2UW1uogYfdnP67Uv7eULvTveboZJg0qUpmJZb5VqzN"
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
<script type="text/javascript">
	var formData = new FormData(); //Ajax로 전달할 전체데이터 
	var regex = new RegExp("(.*?)\.(jpg|jpeg|png|bmp|JPG|JPEG|BMP|PNG)$"); //해당파일 첨부 불가능 
	function fileCheck(fileName) {
		if (!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다")
			$("input[name='uploadCoupon']").focus();
			return false;
		}
		return true;
	}
	function showImage(fileCallpath){
		alert(fileCallPath);
	}

	$(function() {

		var files = '';
		var fileCnt=0;

		$(".custom-file-input")
				.on(
						"change",
						function() { //입력된 파일 리스트 뽑아내기 
							$('.uploadResult ul').html('');
							var inputFile = $("input[name='uploadCoupon']"); //입력된 파일
							files = inputFile[0].files
							for (var i = 0; i < files.length; i++) {
								if (!fileCheck(files[i].name)) {
									continue;
								}
								$('.uploadResult ul')
										.append(
												'<li><span>'
														+ files[i].name
														+ '</span> <a style="cursor:pointer" class="fas fa-times" value="times"></a></li>');
							formData.append(files[i].name, files[i]);
							fileCnt++;
							}
							
							$(".custom-file-input").val("");
							
						}); //파일명 입력해주기 
						
	 	$('.uploadResult ul').on("click","a", function(){ //파일 삭제
	 		console.log($(this).closest('li').children('span').html())
	 		formData.delete($(this).closest('li').children('span').html()) 		
	 		$(this).closest('li').remove();
	 		fileCnt--;
	 	})

		$("#addCoupon").on("click", function() { //ADD COUPON (쿠폰등록) 버튼을 클릭했을 시, 

			formData.append("designName", $("#addName").val()) //쿠폰이름 
			formData.append("designTime", $("#addTime option:selected").val()) //시술시간 
			formData.append("designPrice", $("#addPrice").val()) //시술가격 
			formData.append("designType", $("#addType option:selected").val()) //네일,페디,속눈썹선택 
			formData.append("designOption", $("#addOption").val()) //디자인 or 단순 시술 
			
			for (var i = 0; i < fileCnt; i++) {
				console.log("file명:"+$('.uploadResult ul').children().eq(i).children('span').html())
				formData.append("uploadCoupon", formData.get($('.uploadResult ul').children().eq(i).children('span').html())); //선택된 파일 
			}

			$.ajax({
				url : '../owner/addCoupon',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success: function(){
					location.reload()
				}

			})

		})
		
		$("button[name='detail']").on("click", function(){ //디자인 디테일 보기
			var designId = $(this).attr('designId')
			$.ajax({
				url : '../owner/designDetail',
				data : {designId : designId },
				type : 'POST',
				dataType : 'json',
				success : function (result){
					$(".carousel-inner").html("");
					var photo = result.designPhoto.split("|",result.designPhoto.split("|").length-1);
					console.log("photo="+photo.length)
					var innerCarousel = "";	
					for (var i=0; i<photo.length; i++){
						if (i==0){
							innerCarousel +="<div class='carousel-item active' ><img src='/beaudafest/resources/couponPhoto/"+photo[i]+"' width='100%' height='300'></div>"
						}else
						innerCarousel +="<div class='carousel-item' ><img src='/beaudafest/resources/couponPhoto/"+photo[i]+"' width='100%' height='300'></div>"
					}
					$(".carousel-inner").prepend(innerCarousel)
					$("#designName").val(result.designName)
					$("#designTime").val(result.designTime) 
					$("#designPrice").val(result.designPrice)
					$("#designId").val(result.designId)
					
				}
			})
		})

	
	$("button[name=modalModify]").on("click", function(){
		var hiddenId = $("#designId").val();
		var updatedName = $("#designName").val();
		var updatetime = $("#designTime").val();
		var updatePrice = $("#designPrice").val();
		$.ajax({
			url : '../owner/designUpdate',
			data : {
					designId : hiddenId,
					designName : updatedName,
					designTime : updatetime,
					designPrice : updatePrice				
			
			},
			type : 'POST',
			success : function(){
				location.reload();
			}
			
		})
		
	})
	
	
	$("button[name=modalDelete]").on("click",function(){ //디자인 삭제
		var hiddenId = $("#designId").val();
		$.ajax({
			url : '../owner/designDelete',
			data : { designId : hiddenId },
			type : 'POST',
			success : function(){
				location.reload();
			}
		})
		
	})
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
					<c:forEach items="${couponList}" var="obj" varStatus="i">
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm">


								<img class="card-img-top" width="100%" height="225"
									src="/beaudafest/resources/couponPhoto/${photoList.get(i.index)}" />

								<div class="card-body">
									<p class="card-text">
									<h2>${obj.designName }</h2>
									${obj.designPrice }원
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<!--  고객이 로그인 했을 경우 View 버튼만 보임 
									샵주인 (if 해당 샵의 샵주인이 맞다면) edit 버튼 보임, edit 누르면 모달창 뜨고 사진 수정 삭제 가능
									
									 -->
											<button type="button"
												class="btn btn-sm btn-outline-secondary" data-toggle="modal"
												data-target="#myModal" designId=${obj.designId }
												name="detail">Edit</button>
										</div>
										<small class="text-muted">${obj.designTime }mins</small>
										<!-- 소요시간 -->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<%--첫번째카드 끝 --%>

				</div>
				<%--/row --%>


				<!-- 카드의 View or Edit 클릭 시 /Coupon Detail The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Detail</h4>
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
										<div class="carousel-item active"></div>


										<!-- 	<div class="carousel-item">
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
										</div> -->
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
										<label for="designTime" class="col-form-label">시술시간(분):
										</label> <input type="text" class="form-control" id="designTime">
									</div>
									<div class="form-group">
										<label for="designPrice" class="col-form-label">디자인
											가격(원):</label> <input type="text" class="form-control"
											id="designPrice">
									</div>
									<input type="hidden" id="designId">

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
										<option value="15">15</option>
										<option value="30">30</option>
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
										<option value="옵션">옵션</option>
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
											for="inputGroupFile01">jpg,bmp,jpeg,png</label>
									</div>
								</div>
								<div class="uploadResult">
									<br>
									<ul>

									</ul>
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
