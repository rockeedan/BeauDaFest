<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/dashboard/">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">


<!-- Page level plugin CSS-->
<link href="resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<script src="/resources/js/jquery-3.js"></script>
<script type="text/javascript">

function open_url( type, url, data, target ){ 
	$.ajax({ 
		type: type, 
		url: url, 
		data: data,
		success: function(data){
			$("#"+target).html(data); 
		}
	})
}; 




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
<!-- Custom styles for this template -->
<link href="resources/css/dashboard.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../include/ownerNav.jsp"%>
	<%--Nav바 인클루드  --%>

	<br>
	<div class="row">
	<nav class="col-md-2 d-none d-md-block bg-light sidebar">
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">
		
		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item"><span>&nbsp</span></li>
		<li class="nav-item"><span>&nbsp</span></li>
		<li class="nav-item"><span>&nbsp</span></li>
		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Heading -->
		<div class="sidebar-heading">Dashboard</div>
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo"
		aria-expanded="true" aria-controls="collapseTwo"> 
			
		<i class="fas fa-fw fa-cog"></i> <span>Chart</span>
		</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
		<h6 class="collapse-header">차트보기</h6>
		<a class="collapse-item" href="javascript:;" 
			onClick="open_url('get', 'tables','','contentDiv')">RESERVATIONS</a>
		<a class="collapse-item" href="javascript:;" 
			onClick="open_url('get', 'charts','','contentDiv')"> REVENUE</a>
		</div>
		</div>
		</li>
		<li class="nav-item"><a class="nav-link collapsed" href="#"><span>일정 등록</span></a></li>
	</ul>
	</nav>
	
	<main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
	<br><br>
	<div>
		<div id = "contentDiv">
			하이하이하이하이하이하이하이하이하이하이하이하이하이하이하이
		</div>
	</div>
	
	</main>
	</div>
			
			
			





	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin.min.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="resources/js/demo/datatables-demo.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/chart-area-demo.js"></script>
	<script src="resources/js/demo/chart-pie-demo.js"></script>
	<script src="resources/js/demo/chart-bar-demo.js"></script>
</body>
</html>