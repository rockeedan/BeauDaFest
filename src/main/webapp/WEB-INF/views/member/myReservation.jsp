<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.checked {
	color: orange;
}
</style>
<script>
	//별점 주는 JS 
	function add(ths, sno) {

		for (var i = 1; i <= 5; i++) {
			var cur = document.getElementById("star" + i)
			cur.className = "fa fa-star"
		}

		for (var i = 1; i <= sno; i++) {
			var cur = document.getElementById("star" + i)
			if (cur.className == "fa fa-star") {
				cur.className = "fa fa-star checked"
			}
		}
	}
</script>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<hr>
	<h1 class="h3 mb-2 text-gray-800">${loginId}님의 RESERVATIONS</h1>
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
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr align="center">
							<th>예약번호</th>
							<th>샵 이름</th>
							<th>디자인 이름</th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>예약상태</th>
							<!-- 확정(confirmed)/취소(canceled)/지나감(past)/노쇼(추후)표기 -->
						</tr>
					</thead>
					<tfoot>
						<tr align="center">
							<th>예약번호</th>
							<th>샵 이름</th>
							<th>디자인 이름</th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>예약상태</th>
							<!-- 확정(confirmed)/취소(canceled)/지나감(past)/노쇼(추후)표기 -->
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${list }" var="list">

							<tr align="center">
								<td>${list.RSVNNUM}</td>
								<td><a href="/beaudafest/shopDetail/${list.SHOPNUM}">${list.SHOPNAME}</a></td>
								<td>${list.DESIGNNAME}</td>
								<td>${list.OPTIONNAME}</td>
								<td><fmt:formatDate value="${list.BOOKINGDATE}"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${list.RSVNDATE}"
										pattern="yyyy/MM/dd HH:mm" /></td>
								<td>${list.DESIGNPRICE}</td>
								<td>
								<c:choose>
									<c:when test="${list.RSVNSTATUS eq 1}">취소</c:when>
									<c:when test="${list.RSVNSTATUS eq 2}">노쇼</c:when>
									<c:otherwise>확정<br><a id="cancleRsvn" href="#">취소</a></c:otherwise>
								</c:choose></td>
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
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr align="center">
							<th>예약번호</th>
							<th>샵 이름</th>
							<th>디자인 이름</th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>예약상태</th>

						</tr>
					</thead>
					<tfoot>
						<tr align="center">
							<th>예약번호</th>
							<th>샵 이름</th>
							<th>디자인 이름</th>
							<th>옵션 유무</th>
							<th>예약일시</th>
							<th>예약날짜</th>
							<th>Total</th>
							<th>예약상태</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${history }" var="history">

							<tr align="center">
								<td>${history.RSVNNUM}</td>
								<td><a href="/beaudafest/shopDetail/${history.SHOPNUM}">${history.SHOPNAME}</a></td>
								<td>${history.DESIGNNAME}</td>
								<td>${history.OPTIONNAME}</td>
								<td><fmt:formatDate value="${history.BOOKINGDATE}"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${history.RSVNDATE}"
										pattern="yyyy/MM/dd HH:mm" /></td>
								<td>${history.DESIGNPRICE}</td>
								<td><c:choose>
										<c:when test="${history.RSVNSTATUS eq 1}">
									 취소
								</c:when>
										<c:when test="${history.RSVNSTATUS eq 2}">
									 노쇼
								</c:when>
										<c:otherwise>
									 완료<br>
											<a id="cancleRsvn"
												href="/beaudafest/shopReview/${history.SHOPNUM }"
												data-toggle="modal" data-target="#exampleModal">리뷰달기</a>
										</c:otherwise>
									</c:choose></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Review</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div>
										<div class="form-row">
											<div class="input-group">
												<div class="input-group-prepend"></div>
												<textarea class="form-control" aria-label="With textarea"></textarea>
											</div>
										</div>
										<br>
										<div class="text-right">
											<!-- 별점 주기 -->
											<span class="fa fa-star" id="star1" onclick="add(this,1)"
												style="cursor: pointer"></span> <span class="fa fa-star"
												id="star2" onclick="add(this,2)" style="cursor: pointer"></span>
											<span class="fa fa-star" id="star3" onclick="add(this,3)"
												style="cursor: pointer"></span> <span class="fa fa-star"
												id="star4" onclick="add(this,4)" style="cursor: pointer"></span>
											<span class="fa fa-star" id="star5" onclick="add(this,5)"
												style="cursor: pointer"></span>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button id="addReview" type="button" class="btn btn-primary">Add</button>
							</div>
						</div>
					</div>
				</div>
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



