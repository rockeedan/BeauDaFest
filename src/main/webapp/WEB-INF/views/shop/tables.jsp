<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">SHOP이름</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">RESERVATIONS</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Name</th>
							<th>ID</th>
							<th>Design</th>
							<th>옵션유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>예약번호</th>
							<th>예약상태</th> <!-- 확정(confirmed)/취소(canceled)/지나감(past)/노쇼(추후)표기 -->
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>ID</th>
							<th>Design</th>
							<th>옵션유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>예약번호</th>
							<th>예약상태</th> <!-- 취소/지나감/노쇼(추후)표기 -->
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>nanana</td>
							<td>꿈꾸는디자인</td>
							<td>off(타지점시술)</td>
							<td>2011/04/22/17:00</td>
							<td>2011/04/20</td>
							<td>70000</td>
							<td>201188828</td>
							<td>confirmed</td>
							
						</tr>
						
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->



<!-- Bootstrap core JavaScript-->
<!-- <script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

Core plugin JavaScript
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>


Custom scripts for all pages
<script src="resources/js/sb-admin.min.js"></script>

Page level plugins
<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="resources/js/demo/datatables-demo.js"></script> -->

