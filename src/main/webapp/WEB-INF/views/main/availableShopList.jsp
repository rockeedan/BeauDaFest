<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/carousel/">

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
<link href="carousel.css" rel="stylesheet">
</head>
<body>
	<div>
		<%@ include file="../include/nav.jsp"%> <%--Nav 바 추가 --%>
	</div>
	<br><br><br>
	<div class="container">
		<section class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading">ShopList</h1>
				<p class="lead text-muted"><fmt:formatDate value="${selectDate }" pattern="yyyy년 MM월 dd일 a hh시"/>에 예약가능한 샵입니다</p> <!-- 고객이 선택한 일시 보여주기 -->

			</div>
		</section>

		<div class="container marketing">

			<div class="row">
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: 140x140">
					<title>Placeholder</title><rect width="100%" height="100%"
							fill="#777" />
					<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2>ShopName</h2>  샵 이름
					<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
						euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
						Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
						Praesent commodo cursus magna.</p> 샵 설명
					<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details &raquo;</a> 샵 정보로 들어가기
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<%-- <div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: 140x140">
					<title>Placeholder</title><rect width="100%" height="100%"
							fill="#777" />
					<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2>ShopName</h2>샵 이름
					<p>Duis mollis, est non commodo luctus, nisi erat porttitor
						ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
						purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
						tortor mauris condimentum nibh.</p> 샵 설명
					<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details &raquo;</a> 샵 정보로 들어가기
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: 140x140">
					<title>Placeholder</title><rect width="100%" height="100%"
							fill="#777" />
					<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2>ShopName</h2>
					<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis
						in, egestas eget quam. Vestibulum id ligula porta felis euismod
						semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details &raquo;</a> 샵 정보로 들어가기
					</p>


				</div> --%>
				<c:forEach items="${shopList}" var="shopList">
					<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="140"
						height="140" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: 140x140">
					<title>Placeholder</title><rect width="100%" height="100%"
							fill="#777" />
					<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2>${shopList.shopName }</h2>
					<p>${shopList.shopIntro }</p>
					<p>
						<a class="btn btn-secondary" href="shopDetail/${shopList.shopNum }" role="button">View
							details &raquo;</a>
					</p>
				</div>
				</c:forEach>
				
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<p class="text-center">
			<a href="#" class="btn btn-outline-primary my-2">View More</a> <%--가능한 샵 리스트 더 보기 --%>
		</p>


	</div>
</body>
</html>