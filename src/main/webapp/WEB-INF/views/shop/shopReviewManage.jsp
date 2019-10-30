<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<h1 class="jumbotron-heading">${couponList.get(0).shopName }</h1>  <!-- 샵이름 -->
				<%--샵이름  --%>
				<p class="lead text-muted">${couponList.get(0).shopIntro }</p> <!-- 샵소개 -->
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

		<hr>
		<div class="container">
			<h2 class="text-center">COMMENT</h2>

			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-2">
							<!-- 작성날짜 -->
							<p class="text-secondary text-center">15 Minutes Ago</p>
						</div>
						<div class="col-md-10">
							<p><!-- 작성자 -->
								<strong>Maniruzzaman
										Akash</strong><span class="float-right"><i
									class="text-warning fa fa-star"></i></span> <span class="float-right"><i
									class="text-warning fa fa-star"></i></span> <span class="float-right"><i
									class="text-warning fa fa-star"></i></span> <span class="float-right"><i
									class="text-warning fa fa-star"></i></span> <!-- 별점 -->

							</p>
							<div class="clearfix"></div>
							<p>Lorem Ipsum is simply dummy text of the pr make but also
								the leap into electronic typesetting, remaining essentially
								unchanged. It was popularised in the 1960s with the release of
								Letraset sheets containing Lorem Ipsum passages, and more
								recently with desktop publishing software like Aldus PageMaker
								including versions of Lorem Ipsum.</p>
							<p>
								<a class="float-right btn btn-outline-primary ml-2"> <i
									class="fa fa-reply"></i> Reply 
								</a> <!-- 샵오너가 대댓글달기 -->

							</p>
						</div>
					</div>
					<!-- 대댓글창 (샵오너가 댓글달기) -->
					<div class="card card-inner">
						<div class="card-body">
							<div class="row">
								<div class="col-md-2">
									<!-- 작성날짜 -->
									<p class="text-secondary text-center">15 Minutes Ago</p>
								</div>
								<div class="col-md-10">
									<p>
										<strong>Maniruzzaman
												Akash</strong><!-- 샵이름 -->
									</p>
									<p>Lorem Ipsum is simply dummy text of the pr make but also
										the leap into electronic typesetting, remaining essentially
										unchanged. It was popularised in the 1960s with the release of
										Letraset sheets containing Lorem Ipsum passages, and more
										recently with desktop publishing software like Aldus PageMaker
										including versions of Lorem Ipsum.</p>
									<p>
										
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>