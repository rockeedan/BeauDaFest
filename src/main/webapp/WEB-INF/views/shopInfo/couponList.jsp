<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/porget/css/shopMain.css">
<script src="/beaudafest/resources/js/jquery-3.js"></script>
</head>
<body>
<div class="container">
        <div class="row" >
	        <div class="card-deck" id="popular" style="min-width: 100%">
	        	<div class="col-md-4">
	                <div class="card" style="display: flex;">
	                    <a href="#popular" class="btn text-left custom-card">
	                        <div class="img-hover-zoom">
	                            <img src="/beaudafest/resources/testimg/dashinghao.jpg" class="card-img-top" alt="${p.PFNAME }">
	                        </div>
	                        <div class="card-body" style="text-align: center;">
	                            <div style="display: block; white-space:pre; word-break:break-all;"><h5 class="card-title" style="overflow: hidden; text-overflow:ellipsis;"><c:out value="슈바인학센"/></h5></div>
	                            <p class="card-text">
	                                	테스트디자인입니다
	                            </p>
	                            <p class="card-text">
	                                12000원
	                            </p>
	                            <p class="card-text">
	                                1시간
	                            </p>
	                        </div>
	                    </a>
	                </div>
	            </div>
	        	<div class="col-md-4">
	                <div class="card" style="display: flex;">
	                    <a href="#popular" class="btn text-left custom-card">
	                        <div class="img-hover-zoom">
	                            <img src="/beaudafest/resources/testimg/gelatopeach.jpg" class="card-img-top" alt="${p.PFNAME }">
	                        </div>
	                        <div class="card-body" style="text-align: center;">
	                            <div style="display: block; white-space:pre; word-break:break-all;"><h5 class="card-title" style="overflow: hidden; text-overflow:ellipsis;"><c:out value="${p.PFNAME }"/></h5></div>
	                            <p class="card-text">
									테스트디자인입니다
	                            </p>
	                            <p class="card-text">
	                                13000원
	                            </p>
	                            <p class="card-text">
	                                30분
	                            </p>
	                        </div>
	                    </a>
	                </div>
	            </div>
	        </div>
        </div>
   	</div>
</body>
</html>
<%-- 
<c:forEach items="${list }" var="p">

            <div class="col-md-4">
                <div class="card" style="display: flex;">
                    <a href="portfolio/view?pfnum=${p.PFNUM }" class="btn text-left custom-card">
                        <div class="img-hover-zoom">
                            <img src="/porget/files/${p.PFTHUMB }" class="card-img-top" alt="${p.PFNAME }">
                        </div>
                        <div class="card-body" >
                            <div style="display: block; white-space:pre; word-break:break-all;"><h5 class="card-title" style="overflow: hidden; text-overflow:ellipsis;"><c:out value="${p.PFNAME }"/></h5></div>
                            <p class="card-text">
                                <img src="/porget/files/profile/${p.UPHOTO}" class="rounded-circle" style="width: 50px; height:50px; display: inline;">
                                ${p.UNAME }
                            </p>
                            <p class="text-muted">조회 ${p.PFREAD }, 하트 ${p.JOA}, 댓글수 ${p.REPLYNUM } </p>
                        </div>
                    </a>
                </div>
            </div>
</c:forEach> --%>