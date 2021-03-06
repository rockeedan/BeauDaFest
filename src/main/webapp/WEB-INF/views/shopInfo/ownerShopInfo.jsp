<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEAUDAFEST - ${ownerShopInfo.get(0).shopName }</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/carousel/">

<!-- Bootstrap core CSS -->
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
<link href="/beaudafest/resources/css/carousel.css" rel="stylesheet">
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
		<link href="/beaudafest/resources/css/carousel.css" rel="stylesheet">
	<br>
	<br>
	<br>
	<div class="container">
		<section class="jumbotron text-center"
			style="background-color: #fbceb1">
			<div class="container">
				<h1 class="jumbotron-heading">${ownerShopInfo.get(0).shopName }</h1>
				<%--샵이름  --%>
				<p class="lead text-muted">${ownerShopInfo.get(0).shopIntro }</p>
				<%--샵소개 코멘트  --%>

			</div>
		</section>
		<!-- 메뉴 NAV -->
		<div class="nav-scroller py-1 mb-2">

			<nav class="nav d-flex justify-content-between">
				<a class="p-2 text-muted" href="${ownerShopInfo.get(0).shopNum}">INFO</a> <a
					class="p-2 text-muted" href="#">COUPON</a> <a
					class="p-2 text-muted" href="#">REVIEW</a> <a
					class="p-2 text-muted" href="#">AVAILABILITY</a> <a
					class="p-2 text-muted" href="#">RESERVATION</a>
			</nav>
		</div>
		<hr>
		<div class="container marketing">
			<div class="row featurette">
				<div class="col-md-7">
					<h1 class="featurette-heading">
						${ownerShopInfo.get(0).shopName } </h1><br><h2><span class="text-muted">
						<c:set var="shopAddr" value="${fn:split(ownerShopInfo.get(0).shopAddr,'|')}" />
						<c:forEach var="addr" items="${shopAddr }" varStatus="i" >
							${addr } 
						</c:forEach>
						</span></h2><br>
					<p class="lead">${ownerShopInfo.get(0).shopPhone }</p>
					<p class="lead">${ownerShopInfo.get(0).shopIntro }</p>
					<p class="lead">
						<c:choose>
							<c:when test="${fn:split(ownerShopInfo.get(0).shopOpen,':')[0] eq 0}">
								오전 ${fn:split(ownerShopInfo.get(0).shopOpen,':')[0]+12}:${fn:split(ownerShopInfo.get(0).shopOpen,':')[1]}
							</c:when>
							<c:when test="${fn:split(ownerShopInfo.get(0).shopOpen,':')[0] eq 12}">
								오후 ${fn:split(ownerShopInfo.get(0).shopOpen,':')[0]}:${fn:split(ownerShopInfo.get(0).shopOpen,':')[1]}
							</c:when>
							<c:when test="${fn:split(ownerShopInfo.get(0).shopOpen,':')[0] gt 12}">
								오후 ${fn:split(ownerShopInfo.get(0).shopOpen,':')[0]-12}:${fn:split(ownerShopInfo.get(0).shopOpen,':')[1]}
							</c:when>
							<c:otherwise>
								오전 ${ownerShopInfo.get(0).shopOpen }
							</c:otherwise>
						</c:choose> ~ 
						<c:choose>
							<c:when test="${fn:split(ownerShopInfo.get(0).shopClose,':')[0] eq 0}">
								오전 ${fn:split(ownerShopInfo.get(0).shopClose,':')[0]+12}:${fn:split(ownerShopInfo.get(0).shopClose,':')[1]}
							</c:when>
							<c:when test="${fn:split(ownerShopInfo.get(0).shopClose,':')[0] eq 12}">
								오후 ${fn:split(ownerShopInfo.get(0).shopClose,':')[0]}:${fn:split(ownerShopInfo.get(0).shopClose,':')[1]}
							</c:when>
							<c:when test="${fn:split(ownerShopInfo.get(0).shopClose,':')[0] gt 12}">
								오후 ${fn:split(ownerShopInfo.get(0).shopClose,':')[0]-12}:${fn:split(ownerShopInfo.get(0).shopClose,':')[1]}
							</c:when>
							<c:otherwise>
								오전 ${ownerShopInfo.get(0).shopClose }
							</c:otherwise>
						</c:choose></p>
					<p class="lead">매주 ${ownerShopInfo.get(0).shopOff } 휴무</p>
					<p class="lead">
						<c:choose>
							<c:when test="${ownerShopInfo.get(0).shopParking eq 0 }">주차 불가</c:when>
							<c:when test="${ownerShopInfo.get(0).shopParking eq 1 }">주차 가능</c:when>
						</c:choose>
					</p>
					<p class="lead">${ownerShopInfo.get(0).shopPolicy }</p>
				</div>
				<div class="col-md-5">
					<!-- 디자인 사진 캐러셀 -->
					<c:set var="photo" value="${fn:split(ownerShopInfo.get(0).shopPhoto,'|')}" />
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach var="shopPhoto" items="${photo }" varStatus="i" >
								<c:choose>
									<c:when test="${i.index eq 0 }">
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
									</c:when>
									<c:otherwise>
										<li data-target="#myCarousel" data-slide-to="${i.index}"></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ol>
						<div class="carousel-inner">
							<c:forEach var="shopPhoto" items="${photo }" varStatus="i" >
								<c:choose>
									<c:when test="${i.index eq 0 }">
									<div class="carousel-item active">
										<img src="/beaudafest/resources/shopPhoto/${shopPhoto}" width="100%" height="100%">
										<div class="container">
											<div class="carousel-caption text-left"></div>
										</div>
									</div>
									</c:when>
									<c:otherwise>
									<div class="carousel-item">
										<img src="/beaudafest/resources/shopPhoto/${shopPhoto}" width="100%" height="100%">
										<div class="container">
											<div class="carousel-caption text-left"></div>
										</div>
									</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
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
		<p class="text-center">
			<a href="../../owner/modifyShop/${ownerShopInfo.get(0).shopNum}" class="btn btn-outline-primary my-2">Modify</a>
			<%--가능한 샵 리스트 더 보기 --%>
		</p>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="/beaudafest/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/beaudafest/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/beaudafest/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>