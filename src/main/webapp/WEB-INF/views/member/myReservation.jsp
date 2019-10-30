<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<hr>
	<h1 class="h3 mb-2 text-gray-800">${loginId}님의 RESERVATIONS </h1>
	<hr>
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
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
					<thead>
						<tr> 
							<th>예약번호</th>
							<th>아이디</th>
							<th>샵 이름 </th>
							<th>디자인 이름 </th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>샵 주소</th>
							<th>예약상태</th> <!-- 확정(confirmed)/취소(canceled)/지나감(past)/노쇼(추후)표기 -->
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>예약번호</th>
							<th>아이디</th>
							<th>샵 이름 </th>
							<th>디자인 이름 </th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>샵 주소</th>
							<th>예약상태</th> <!-- 확정(confirmed)/취소(canceled)/지나감(past)/노쇼(추후)표기 -->
						</tr>
					</tfoot>
					<tbody>
					<c:forEach items="${list }" var="list">
				
						<tr align = "center">
							<td>${list.RSVNNUM}</td>
							<td>${list.MEMBERID}</td>
							<td>${list.SHOPNAME}</td>
							<td>${list.DESIGNNAME}</td>
							<td>${list.OPTIONNAME}</td>
							<td>
								<fmt:formatDate value="${list.BOOKINGDATE}" pattern="yyyy/MM/dd"/>
							</td>
							<td>
								<fmt:formatDate value="${list.RSVNDATE}" pattern="yyyy/MM/dd HH:mm"/>
							</td>
							<td>${list.DESIGNPRICE}</td>
							<td>${list.SHOPADDR}</td>
							<td></td>
							
						</tr>
						
						</c:forEach>
					</tbody>
				</table>
				
				
				
				
				
				
				
				
			</div>
		</div>
	</div>
	
	
	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">HISTORY</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
					<thead>
						<tr> 
							<th>예약번호</th>
							<th>아이디</th>
							<th>샵 이름 </th>
							<th>디자인 이름 </th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>샵 주소</th>
							
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>예약번호</th>
							<th>아이디</th>
							<th>샵 이름 </th>
							<th>디자인 이름 </th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>샵 주소</th>
							
						</tr>
					</tfoot>
					<tbody>
					<c:forEach items="${history }" var="history">
				
						<tr align = "center">
							<td>${history.RSVNNUM}</td>
							<td>${history.MEMBERID}</td>
							<td>${history.SHOPNAME}</td>
							<td>${history.DESIGNNAME}</td>
							<td>${history.OPTIONNAME}</td>
							<td>
								<fmt:formatDate value="${history.BOOKINGDATE}" pattern="yyyy/MM/dd"/>
							</td>
							<td>
								<fmt:formatDate value="${history.RSVNDATE}" pattern="yyyy/MM/dd HH:mm"/>
							</td>
							<td>${history.DESIGNPRICE}</td>
							<td>${history.SHOPADDR}</td>
							
						</tr>
						
						</c:forEach>
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
