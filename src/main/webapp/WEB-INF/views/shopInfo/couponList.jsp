<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(function(){
	$("button[name=couponDetail]").on("click", function(){ //디자인 디테일 보기
		
		var designId = $(this).attr('designId')
		console.log(designId)
		$.ajax({
			url : '/beaudafest/designDetail',
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

})//ready

</script>
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
	<c:choose>
			<c:when test="${memberStatus eq null}">
				<%@ include file="../include/nav.jsp"%>
			</c:when>
			<c:when test="${memberStatus eq 0}">
				<%-- 일반회원일때 --%>
				<%@ include file="../include/memberNav.jsp"%>
			</c:when>
			<c:when test="${memberStatus eq 1}">
				<%-- 오너회원일때 --%>
				<%@ include file="../include/ownerNav.jsp"%>
			</c:when>
			<c:otherwise>
				<%-- 회원이아닐때 (로그인X) --%>
				<%@ include file="../include/nav.jsp"%>
			</c:otherwise>
		</c:choose>
	<br>
	<br>
	<br>
	<div class="container">
		<section class="jumbotron text-center"
			style="background-color: #fbceb1">
			<div class="container">
				<h1 class="jumbotron-heading">${couponList.get(0).shopName }</h1>
				<%--샵이름  --%>
				<p class="lead text-muted">${couponList.get(0).shopIntro }</p>
				<%--샵소개 코멘트  --%>
			</div>
		</section>

		<!-- 메뉴 NAV -->
		<div class="nav-scroller py-1 mb-2">
			<nav class="nav d-flex justify-content-between">
				<a class="p-2 text-muted"
					href="../shopDetail/${couponList.get(0).shopNum }">INFO</a> <a
					class="p-2 text-muted" href="#">COUPON</a> <a
					class="p-2 text-muted" href="#">REVIEW</a>
			</nav>
		</div>

		<hr>
		<div class="container marketing">
			<%--디자인리스트 보여주기  --%>
			<div class="album py-5 bg-light">
				<div class="container">
					<div class="row">
						<c:forEach items="${couponList }" var="obj" varStatus="i">
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
																
									 -->
												<button type="button"
													class="btn btn-sm btn-outline-secondary"
													data-toggle="modal" data-target="#myModal" name="couponDetail" designId=${obj.designId }>View</button>

											</div>
											<small class="text-muted" >${obj.designTime }mins</small>
											<!-- 소요시간 -->
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<%--첫번째카드 끝 --%>

					</div>
					<%--/row --%>
				</div>

				<!-- 카드의 View 클릭 시 /Coupon Detail The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">DETAIL</h4>
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
			<a href="#" class="btn btn-outline-primary my-2">View More</a>
			<%--다음리스트보기 --%>
		</p>

	</div>
</body>
</html>
