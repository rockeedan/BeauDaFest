<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<%@ include file="../include/nav.jsp"%>
	</div>
	<header class="masthead text-center text-white">
		<div class="masthead-content">
			<div class="container">
				<h1 class="masthead-heading mb-0">
					BEAUDA<img src="/beaudafest/resources/img/heart.png" width="80"
						height="80" class="d-inline-block align-top" alt="">FEST
				</h1>
				<h2 class="masthead-subheading mb-0">Will Rock Your Beauty</h2>
				<div class="form-group">
					<span class="form-label">DATE</span> <input class="form-control"
						type="date" required>


					<div class="form-group">
						<span class="form-label">Time</span> <input class="form-control"
							type="time" required>
					</div>

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