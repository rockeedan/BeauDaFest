<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">

<!-- Bootstrap core CSS -->


<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${memberStatus eq null}">
				<%@ include file="../include/nav.jsp"%>
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
		<link href="/beaudafest/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<section class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading">ShopList</h1>
				<p class="lead text-muted"></p>
				<!-- 고객이 선택한 일시 보여주기 -->

			</div>
		</section>

		<div class="container marketing">

			<div class="row">
				<c:forEach items="${ownerShopList}" var="shopList">
					<c:set var="photo" value="${fn:split(shopList.shopPhoto,'|')[0]}" />
					<div class="col-lg-4">
						<!-- <svg class="bd-placeholder-img rounded-circle" width="140"
							height="140" xmlns="http://www.w3.org/2000/svg"
							preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
							aria-label="Placeholder: 140x140">
					<title>Placeholder</title><rect width="100%" height="100%"
								fill="#777" />
					<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg> -->
					<img src="/beaudafest/resources/shopPhoto/${photo}" class="rounded-circle" width="140"
							height="140">
						<h2>${shopList.shopName }</h2>
						<p>${shopList.shopIntro }</p>
						<p>
							<a class="btn btn-secondary"
								href="shopDetail/${shopList.shopNum }" role="button">View
								details &raquo;</a>
						</p>
					</div>
				</c:forEach>

				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<p class="text-center">
			<a href="#" class="btn btn-outline-primary my-2">View More</a>
			<%--가능한 샵 리스트 더 보기 --%>
		</p>


	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="/beaudafest/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/beaudafest/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>