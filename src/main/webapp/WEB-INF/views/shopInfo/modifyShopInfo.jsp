<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Custom fonts for this template-->
<link href="/beaudafest/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/beaudafest/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="/beaudafest/resources/js/jquery-3.js"></script>
<script type="text/javascript">
	$(function() {
		//휴무 요일 checked
		var offDate = "${shopDetail.get(0).shopOff}";
		var offDateArr = offDate.split(",");
		var dateLength = $(".offCheck").length;
		for(var i=0; i<offDateArr.length; i++){
			for(var j=0; j<dateLength; j++){
				if($(".offCheck:eq("+j+")").val()===offDateArr[i]){
					$(".offCheck:eq("+j+")").attr('checked',true);
				}
			}
		}
		//주차 유무 selected
		for(var i=0; i<$(".parking").length; i++){
			if("${shopDetail.get(0).shopParking}"===$(".parking:eq("+i+")").val()){
				$(".parking:eq("+i+")").attr('selected',true);
				break;
			}
		}
		//취소 정책 selected
		for(var i=0; i<$(".policy").length; i++){
			if("${shopDetail.get(0).shopPolicy}"===$(".policy:eq("+i+")").html()){
				$(".policy:eq("+i+")").attr('selected',true);
				break;
			}
		}
		
		//사진
		var photos = "${shopDetail.get(0).shopPhoto}";
		var photoArray = photos.split("|");//length구하기용....
		photoArray = photos.split("|",photoArray.length-1);
		for(var i=0; i<photoArray.length; i++){
			var splitArr = photoArray[i].split('_');
			photoArray[i]='';
			for(var j=1; j<splitArr.length; j++){
				if(j==splitArr.length-1){
					photoArray[i] += splitArr[j];
				} else {
					photoArray[i] += splitArr[j]+"_";
				}
			}
			console.log(photoArray[i]);
			$('.uploadResult ul').append('<li><span>'+ photoArray[i]+ '</span> <a style="cursor:pointer" class="fas fa-times"></a></li>');
		}
		
		
		var regex = new RegExp("(.*?)\.(jpg|jpeg|bmp|png|JPG|JPEG|BMP|PNG)$");
		var maxSize = 52428880; //사이즈 --> 할지말지
		var fileCnt = 0;
		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {//-->할지말지
				alert("파일 사이즈 초과");
				return false;
			}
			if (!regex.test(fileName)) {
				alert('해당 종류의 파일은 업로드 할 수 없습니다.');//이미지 파일 만 올리게
				return false;
			}
			return true;
		}

		var formData = new FormData();
		var files = '';

		//파일 선택했을 때 (shop사진 고르고 확인)
		$('#inputGroupFile01').on("change",function() {
			$('.uploadResult ul').html('');
			var inputFile = $("#inputGroupFile01");
			files = inputFile[0].files;
			fileCnt = files.length;
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					$('.uploadResult ul').html('');
					return false;
				}
				$('.uploadResult ul').append('<li><span>'+ files[i].name + '</span> <a style="cursor:pointer" class="fas fa-times"></a></li>');
				formData.append(files[i].name, files[i]);
			}
		});


		//올린 파일X(삭제) 눌렀을때
		$('.uploadResult').on('click', 'a', function() {
			console.log($(this).siblings('span').html());
			$(this).closest('li').remove();
			fileCnt--;
		})

		//modify 버튼 눌렀을때 
		$('.modify').click(function() {
					//shop사진 formData에 붙이기
					if(fileCnt!=0){//사진 수정하면
						for (var i = 0; i < fileCnt; i++) {
							formData.append("uploadFile", formData.get($('.uploadResult ul').find('span:eq(' + i + ')').html()));
							alert('사진선택ㅇㅇ');
						}
					} 

					//휴무일
					var shopOff = "";
					var check = $("input[name=shopOffCheck]:checked");
					check.each(function(idx, size) {
						if (idx == (check.length - 1)) {
							shopOff += $(this).val();
						} else {
							shopOff += $(this).val() + ",";
						}
					});
					formData.append("shopNum", '${shopDetail.get(0).shopNum}'); //샵넘버
					formData.append("shopOpen", $('input[name="shopOpen"]').val()); //샵 오픈시간
					formData.append("shopClose", $('input[name="shopClose"]').val()); //샵 닫는시간
					formData.append("shopOff", shopOff); //샵 휴무
					formData.append("shopParking", $('select[name=shopParking] option:selected').val());//주차유무
					formData.append("shopPolicy", $('select[name=shopPolicy] option:selected').val()); //취소정책
					formData.append("shopIntro",$('textarea[name="shopIntro"]').val()) //샵 소개
					
					$.ajax({
						url : '/beaudafest/owner/modifyShop',
						processData : false,
						contentType : false,
						data : formData,
						type : 'POST',
						success : function(data) {
							alert("수정이 완료되었습니다.");
							location.href = "/beaudafest/owner/shopDetail/"+${shopDetail.get(0).shopNum};
						}
					});
				});
		
		//delete 버튼 눌렀을 때
		$('.delete').click(function(){
			var deleteShop  = confirm('정말 샵을 삭제하시겠습니까?')
			if(deleteShop){
				location.href='../deleteShop/'+${shopDetail.get(0).shopNum};
			}
		});
	});
</script>
<body class="bg-gradient-primary">
	<div>
		<c:choose>
			<c:when test="${memberStatus eq null}">
				<%@ include file="../include/nav.jsp"%>
			</c:when>
			<c:when test="${memberStatus eq 0}">
				<%-- 일반회원일때 --%>
				<%@ include file="../include/memberNav.jsp"%>
			</c:when>
			<c:when test="${memberStatus eq 1}">
				<%-- 오너회원일때 --%>
				<%@ include file="../include/ownerNav.jsp"%>
			</c:when>
			<c:otherwise>
				<%-- 회원이아닐때 (로그인X) --%>
				<%@ include file="../include/nav.jsp"%>
			</c:otherwise>
		</c:choose>
	</div>

	<br>
	<br>
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">
									<span class="login100-form-title p-b-26"> <strong>BEAUDA</strong><img
										src="/beaudafest/resources/img/heart.png" width="30"
										height="30" class="d-inline-block align-top" alt="">
										FEST
									</span>
								</h1>
							</div>
							<form>
								<div class="form-group">
									<input type="text" class="form-control" id="exampleShopName"
										placeholder="Shop Name" name="shopName" readonly value="${shopDetail.get(0).shopName }">
								</div>

								<div class="form-group">
									<input type="tel" class="form-control" id="exampleInputPhone"
										placeholder="Phone Number" name="shopPhone" readonly value="${shopDetail.get(0).shopPhone }">
								</div>
								<div class="form-group row">
									<!-- 주소는 추후 db 사용할것임  -->
									<div class="col-sm-4 mb-3 mb-sm-0">
										<select class="form-control" name="shopAddrBox" disabled>
											<option disabled selected>${fn:split(shopDetail.get(0).shopAddr,'|')[0]}</option>
											<!-- <option>서울시</option> -->
										</select>
									</div>
									<div class="col-sm-4">
										<select class="form-control" name="shopAddrBox" disabled>
											<option disabled selected>${fn:split(shopDetail.get(0).shopAddr,'|')[1]}</option>
											<!-- <option>강남구</option>
											<option>서초구</option>
											<option>마포구</option> -->
										</select>
									</div>
									<div class="col-sm-4">
										<select class="form-control" name="shopAddrBox" disabled>
											<option disabled selected>${fn:split(shopDetail.get(0).shopAddr,'|')[2]}</option>
											<!-- <option>서초동</option>
											<option>합정동</option>
											<option>개포동</option> -->
										</select>
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="exampleInputAddr"
										placeholder="상세주소" name="shopAddrDetail" disabled value="${fn:split(shopDetail.get(0).shopAddr,'|')[3]}">
								</div>
								<div class="text-center">
									<h6 class="h6 text-gray-900 mb-4">Shop운영시간/휴무(선택)</h6>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="time" class="form-control" id="exampleStartTime"
												name="shopOpen" value="${shopDetail.get(0).shopOpen }">
										</div>
										<div class="col-sm-6">
											<input type="time" class="form-control" id="exampleEndTime"
												name="shopClose" value="${shopDetail.get(0).shopClose }">
										</div>
									</div>
								</div>
								<!-- 휴무요일선택 -->
								<div class="form-group">
									<div class="form-control">
										<div class="text-center dateCheckGroup">
											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox1" value="월" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox1">월</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox2" value="화" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">화</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox2" value="수" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">수</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox2" value="목" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">목</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox2" value="금" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">금</label>
											</div>

											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox2" value="토" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">토</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input offCheck" type="checkbox"
													id="inlineCheckbox2" value="일" name="shopOffCheck">
												<label class="form-check-label" for="inlineCheckbox2">일</label>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<select class="form-control" required name="shopParking">
										<option class="parking" disabled>Parking</option>
										<option class="parking" value="0">주차 불가</option>
										<option class="parking" value="1">1대 이상</option>
									</select>
								</div>

								<div class="form-group ">
									<select class="form-control" required name="shopPolicy">
										<option class="policy" disabled>Policy</option>
										<option class="policy">하루 전날까지 취소 가능</option>
										<option class="policy">취소불가</option>
									</select>
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroupFileAddon01">ShopPhoto</span>
									</div>
									<div class="custom-file">
										<input type="file" class="custom-file-input"
											id="inputGroupFile01"
											aria-describedby="inputGroupFileAddon01" multiple
											accept=".gif, .jpg, .png, .bmp, .jpeg"> <label
											class="custom-file-label" for="inputGroupFile01">jpg,jpeg,bmp,png</label>
									</div>
								</div>

								<div class='uploadResult'>
									<ul></ul>
								</div>

								<div class="form-group">

									<textarea class="form-control" id="shopIntro" rows="3"
										name="shopIntro" placeholder="Shop소개" >${shopDetail.get(0).shopIntro }</textarea>
								</div>


								<!-- <button id="modify"
									class="btn btn-primary btn-user btn-block" type="button">Modify</button>
								<button id="signUpbutton"
									class="btn btn-primary btn-user btn-block" type="button">Delete</button> -->


								<p class="text-center">
									<button type="button" class="btn btn-outline-primary my-2 modify">Modify</button>
									<button type="button" class="btn btn-outline-danger my-2 delete">Delete</button>
								</p>
								<hr>
								<input type="hidden" name="shopOff" id="shopOff" value="">
								<input type="hidden" name="shopAddr" id=shopAddr value="">
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/beaudafest/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="/beaudafest/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/beaudafest/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/beaudafest/resources/js/sb-admin-2.min.js"></script>


</body>
</html>