<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- resource/demo/chart-area-demo.js 와 chart-bar-demo.js 에서 데이터 변경 가능 -->
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Charts</h1>
		<p class="mb-4">
			let's analyze your shop.
		</p>

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
 <!-- Bootstrap core JavaScript-->
 <!-- 
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  Core plugin JavaScript
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  Custom scripts for all pages
  <script src="resources/js/sb-admin-2.min.js"></script>

  Page level plugins
  <script src="resources/vendor/chart.js/Chart.min.js"></script>

  Page level custom scripts
  <script src="resources/js/demo/chart-area-demo.js"></script>
  <script src="resources/js/demo/chart-pie-demo.js"></script>
  <script src="resources/js/demo/chart-bar-demo.js"></script> -->
