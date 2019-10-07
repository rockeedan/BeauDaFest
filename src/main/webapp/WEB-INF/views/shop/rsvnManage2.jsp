<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/dashboard/">

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">


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
<link href="resources/css/dashboard.css" rel="stylesheet">
</head>
<body>

	<div>
		<%@ include file="../include/ownerNav.jsp"%>
		<%--Nav바 인클루드  --%>
	</div>
	<br>
	<br>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="#">
								<span data-feather="home"></span> Reservation <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span> Reviews
						</a></li>


					</ul>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">날짜 의 예약</h1>
				<!-- 그 주 집어넣기 -->
				<div class="btn-toolbar mb-2 mb-md-0">

					<button type="button"
						class="btn btn-sm btn-outline-secondary dropdown-toggle">
						<span data-feather="calendar"></span> This week
					</button>
				</div>
			</div>

			<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

			<h2>예약리스트</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>#</th>
							<th>예약자명</th>
							<th>예약날짜</th>
							<th>시술명(디자인명)</th>
							<th>옵션</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1,001</td>
							<td>Lorem</td>
							<td>ipsum</td>
							<td>dolor</td>
							<td>sit</td>
							<td>sit</td>
						</tr>
						<tr>
							<td>1,002</td>
							<td>amet</td>
							<td>consectetur</td>
							<td>adipiscing</td>
							<td>elit</td>
							<td>elit</td>
						</tr>
						<tr>
							<td>1,003</td>
							<td>Integer</td>
							<td>nec</td>
							<td>odio</td>
							<td>Praesent</td>
						</tr>
						<tr>
							<td>1,003</td>
							<td>libero</td>
							<td>Sed</td>
							<td>cursus</td>
							<td>ante</td>
						</tr>
						<tr>
							<td>1,004</td>
							<td>dapibus</td>
							<td>diam</td>
							<td>Sed</td>
							<td>nisi</td>
						</tr>
						<tr>
							<td>1,005</td>
							<td>Nulla</td>
							<td>quis</td>
							<td>sem</td>
							<td>at</td>
						</tr>
						<tr>
							<td>1,006</td>
							<td>nibh</td>
							<td>elementum</td>
							<td>imperdiet</td>
							<td>Duis</td>
						</tr>
						<tr>
							<td>1,007</td>
							<td>sagittis</td>
							<td>ipsum</td>
							<td>Praesent</td>
							<td>mauris</td>
						</tr>
						<tr>
							<td>1,008</td>
							<td>Fusce</td>
							<td>nec</td>
							<td>tellus</td>
							<td>sed</td>
						</tr>
						<tr>
							<td>1,009</td>
							<td>augue</td>
							<td>semper</td>
							<td>porta</td>
							<td>Mauris</td>
						</tr>
						<tr>
							<td>1,010</td>
							<td>massa</td>
							<td>Vestibulum</td>
							<td>lacinia</td>
							<td>arcu</td>
						</tr>
						<tr>
							<td>1,011</td>
							<td>eget</td>
							<td>nulla</td>
							<td>Class</td>
							<td>aptent</td>
						</tr>
						<tr>
							<td>1,012</td>
							<td>taciti</td>
							<td>sociosqu</td>
							<td>ad</td>
							<td>litora</td>
						</tr>
						<tr>
							<td>1,013</td>
							<td>torquent</td>
							<td>per</td>
							<td>conubia</td>
							<td>nostra</td>
						</tr>
						<tr>
							<td>1,014</td>
							<td>per</td>
							<td>inceptos</td>
							<td>himenaeos</td>
							<td>Curabitur</td>
						</tr>
						<tr>
							<td>1,015</td>
							<td>sodales</td>
							<td>ligula</td>
							<td>in</td>
							<td>libero</td>
						</tr>

						<tr>
							<td>1,015</td>
							<td>sodales</td>
							<td>ligula</td>
							<td>in</td>
							<td>libero</td>
						</tr>
					</tbody>
				</table>
			</div>
			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script src="resources/js/dashboard.js"></script>
</body>
</html>