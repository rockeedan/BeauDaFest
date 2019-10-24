<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/one-page-wonder.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.js"></script>
<title>BEAUDAFEST</title>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${memberStatus eq null}">
				<%@ include file="../include/nav.jsp"%>
			</c:when>
			<c:when test="${memberStatus eq 0}"> <%-- 일반회원일때 --%>
				<%@ include file="../include/memberNav.jsp"%>
			</c:when>
			<c:when test="${memberStatus eq 1}"> <%-- 오너회원일때 --%>
				<%@ include file="../include/ownerNav.jsp"%>
			</c:when>
			<c:otherwise>						 <%-- 회원이아닐때 (로그인X) --%>
				<%@ include file="../include/nav.jsp"%>
			</c:otherwise>
		</c:choose>
		<!-- Bootstrap core CSS -->
		<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Custom fonts for this template -->
		<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
		<link href="resources/css/one-page-wonder.min.css" rel="stylesheet">
	</div>
	<header class="masthead text-center text-white">
		<div class="masthead-content">
			<div class="container">
				<h1 class="masthead-heading mb-0">
					BEAUDA<img src="/beaudafest/resources/img/heart.png" width="80"
						height="80" class="d-inline-block align-top" alt="">FEST
				</h1>
				<h2 class="masthead-subheading mb-0">Will Rock Your Beauty</h2>
				<br> <br>
				<div class="form-group">
					<form action="searchShopList" method="post">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">SEARCH</span>
							</div>
	<!-- <<<<<<< HEAD
							<form action="searchShopList" method="post">
	
								<div class="form-group">
									<span class="form-label">DATE</span> <input class="form-control"
										type="date" required name="date">
	
									<div class="form-group">
										<span class="form-label">Time</span> <input
											class="form-control" type="time" required name="time">
									</div>
	======= -->
							<input type="date" aria-label="searchDate" class="form-control" name="date">
							<input type="time" aria-label="searchTime" class="form-control" name="time">
							<input type="text" aria-label="searchPlace" class="form-control" name="shopAddr"
								placeholder="WHERE">
	
						</div>
						<br> <br>
						<button class="btn btn-danger btn-lg btn-block" type="submit"
							id="searchShops">To Be BeauDa<img src="/beaudafest/resources/img/heart.png" width="30"
								height="30" class="d-inline-block align-top" alt="">Fest</button>
					</form>
				</div>
			</div>
		</div>
		<div class="bg-circle-1 bg-circle"></div>
		<div class="bg-circle-2 bg-circle"></div>
		<div class="bg-circle-3 bg-circle"></div>
		<div class="bg-circle-4 bg-circle"></div>
	</header>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="resources/img/01.jpg"
							alt="">
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">For those about to rock...</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="resources/img/02.jpg"
							alt="">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="p-5">
						<h2 class="display-4">We salute you!</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="resources/img/03.jpg"
							alt="">
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">Let there be rock!</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>