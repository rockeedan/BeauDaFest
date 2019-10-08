<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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
</head>
<div>
	<%@ include file="../include/nav.jsp"%>
</div>
<br><br><br>
<body class="bg-light">
	<div class="container">
		<section class="jumbotron text-center"  style="background-color: #fbceb1">
			<div class="container">
				<h1 class="jumbotron-heading">NAMDAREUM</h1>
				<!-- 샵 이름 -->
				<p class="lead text-muted">최고의 디자인이 어쩌고 블라 샵 코멘트</p> 

			</div>
		</section>
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-secondary badge-pill">2</span>	<!-- 디자인(쿠폰) 선택 갯수  -->
				
				</h4>
				<ul class="list-group mb-3">
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<strong>디자인 이름</strong>
							</h6>
							<small class="text-muted">시술시간</small>
						</div> <span class="text-muted">가격</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<strong>옵션이름</strong>
							</h6>
							<small class="text-muted">시술시간</small>
						</div> <span class="text-muted">가격</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">
								<strong>예약날짜</strong>
							</h6>

						</div> <span class="text-muted">날짜/시간</span>
					</li>

					<li class="list-group-item d-flex justify-content-between"><span>Total
							(KRW)</span><small class="text-muted">총 시술시간</small> <strong>총가격</strong></li>
				</ul>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">예약 정보 확인</h4>
				<form class="needs-validation" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="shopName">Shop Name</label> <input type="text"
								class="form-control" id="shopName" placeholder="" value=""
								disabled>
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">예약자이름</label> <input type="text"
								class="form-control" id="memberName" placeholder="" value=""
								required>
							<div class="invalid-feedback">Valid Username is required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="memberId">예약자ID</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">@</span>
							</div>
							<input type="text" class="form-control" id="memberId"
								placeholder="memberId" disabled>
							<div class="invalid-feedback" style="width: 100%;">Your ID
								is required.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="phone">연락처 <span class="text-muted">(필수)</span></label>
						<input type="tel" class="form-control" id="phone"
							placeholder="010-XXXX-XXXX">
						<div class="invalid-feedback">연락처를 입력해주세요.</div>
					</div>

					<div class="row"></div>

					<hr class="mb-4">

					<button class="btn btn-primary btn-lg btn-block" type="submit">Continue
						to confirm</button>
				</form>
			</div>
		</div>
	</div>

</body>


</html>