<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<style>
.card-inner {
	margin-left: 4rem;
}

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

.checked {
	color: orange;
}
</style>
<script> //별점 주는 JS 
function add(ths,sno){

	for (var i=1;i<=5;i++){
		var cur=document.getElementById("star"+i)
		cur.className="fa fa-star"
	}
	
	for (var i=1;i<=sno;i++){
		var cur=document.getElementById("star"+i)
		if(cur.className=="fa fa-star"){
			cur.className="fa fa-star checked"
		}
	}
}
</script>
<title>BEAUDAFEST</title>
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
				<h1 class="jumbotron-heading"></h1>
				<!-- 샵이름 -->
				<%--샵이름  --%>
				<p class="lead text-muted"></p>
				<!-- 샵소개 -->
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
		<div class="container">
			<h2 class="text-center">평점(${shopScore}/5)</h2>
			<br>
			<form>
				<div class="form-row">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">COMMENT</span>
						</div>
						<textarea class="form-control" aria-label="With textarea"></textarea>
					</div>
				</div><br>
				<div class="text-right"> <!-- 별점 주기 -->
				<span class="fa fa-star" id="star1" onclick="add(this,1)" style="cursor: pointer"></span> <span
					class="fa fa-star" id="star2" onclick="add(this,2)" style="cursor: pointer"></span> <span
					class="fa fa-star" id="star3" onclick="add(this,3)" style="cursor: pointer"></span> <span
					class="fa fa-star" id="star4" onclick="add(this,4)" style="cursor: pointer"></span> <span
					class="fa fa-star" id="star5" onclick="add(this,5)" style="cursor: pointer"></span></div>

			</form>
			<br>
			<div class="text-right">
				<button type="button" class="btn btn-outline-success">Submit</button>
			</div>
			<br> <br>
			
					<!-- <div class="row">
						<div class="col-md-2">

							<p class="text-secondary text-center">15 Minutes Ago</p>
							작성날짜
						</div>
						<div class="col-md-10">
							<p>
								작성자
								<strong>Maniruzzaman Akash</strong><span class="float-right">
									별점 보여주기
								<i class="text-warning fa fa-star"></i></span> <span class="float-right"><i
									class="text-warning fa fa-star"></i></span> <span class="float-right"><i
									class="text-warning fa fa-star"></i></span> <span class="float-right"><i
									class="text-warning fa fa-star"></i></span>
							
							</p>
							<div class="clearfix"></div>
							내용
							<p>Lorem Ipsum is simply dummy text of the pr make but also
								the leap into electronic typesetting, remaining essentially
								unchanged. It was popularised in the 1960s with the release of
								Letraset sheets containing Lorem Ipsum passages, and more
								recently with desktop publishing software like Aldus PageMaker
								including versions of Lorem Ipsum.</p>
							<p></p>
						</div>
					</div> -->
					<c:forEach items="${reviewList }" var="list">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-md-2">
										<p class="text-secondary text-center">
											<fmt:formatDate value="${list.rsvnDate}" pattern="yy-MM-dd 방문"/>
										</p>
									</div>
									<div class="col-md-10">
										<p>
											<strong>${list.memberName}</strong>
											<c:forEach var="star" begin="1" end="${list.reviewScore}">
												<span class="float-right"><i
												class="text-warning fa fa-star"></i></span>
											</c:forEach>
										</p>
										<div class="clearfix"></div>
										<p>${list.reviewComment }</p>
										<p></p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<!-- 대댓글창 (샵오너가 댓글달기) -->
					<!-- <div class="card card-inner">
						<div class="card-body">
							<div class="row">
								<div class="col-md-2">

									<p class="text-secondary text-center">15 Minutes Ago</p>
									작성날짜
								</div>
								<div class="col-md-10">
									<p>
										샵이름
										<strong>Maniruzzaman Akash</strong>
									</p>
									<p>Lorem Ipsum is simply dummy text of the pr make but also
										the leap into electronic typesetting, remaining essentially
										unchanged. It was popularised in the 1960s with the release of
										Letraset sheets containing Lorem Ipsum passages, and more
										recently with desktop publishing software like Aldus PageMaker
										including versions of Lorem Ipsum.</p>
									<p></p>
								</div>
							</div>
						</div>
					</div>  대댓글-->
		</div>
	</div>
</body>
</html>