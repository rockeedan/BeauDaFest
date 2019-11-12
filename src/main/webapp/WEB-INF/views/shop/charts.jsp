<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- resource/demo/chart-area-demo.js 와 chart-bar-demo.js 에서 데이터 변경 가능 -->
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<hr>
	<h1 class="h3 mb-2 text-gray-800">Charts</h1>
	<hr>
	<p class="mb-4">let's analyze your shop.</p>

	<!-- Content Row -->
	<div class="row">

		<div class="col-xl-8 col-lg-7">

			<!-- Area Chart -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">월별 금액</h6>
				</div>
				<div class="card-body">
					<div class="chart-area">
						<canvas id="myAreaChart"></canvas>
					</div>
					<hr>
					Styling for the area chart can be found in the
					<code>/js/demo/chart-area-demo.js</code>
					file.
				</div>
			</div>

			<!-- 예약 수 Bar chart -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">월별예약 수</h6>
				</div>
				<div class="card-body">
					<div class="chart-bar">
						<canvas id="myBarChart"></canvas>
					</div>
					<hr>
					Styling for the bar chart can be found in the
					<code>/js/demo/chart-bar-demo.js</code>
					file.
				</div>
			</div>

		</div>

	</div>

</div>
<!-- /.container-fluid -->
<!--Page level plugins-->
<script
	src="/beaudafest/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script
	src="/beaudafest/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="/beaudafest/resources/js/demo/datatables-demo.js"></script>
<script src="/beaudafest/resources/vendor/chart.js/Chart.min.js"></script>
<script src="/beaudafest/resources/js/demo/chart-area-demo.js"></script>
<script src="/beaudafest/resources/js/demo/chart-bar-demo.js"></script>

