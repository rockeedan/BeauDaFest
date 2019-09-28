<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="/beaudafest/resources/js/jquery-3.js"></script>
<style>
tr.selectOpenTime{
	background-color: red;
}
button.btn{
	border-color: black
}
</style>
</head>
<body>

<c:forEach begin="0" end="23" var="i">
	<c:choose>
		<c:when test="${i<10 }">
			<button type="button" class="btn btn-block">
				<start checked="false">0${i }:00</start> ~ <end>0${i }:30</end>
			</button>
			<button type="button" class="btn btn-block">
				<start checked="false">0${i }:30</start> ~ <end><c:choose><c:when test="${i==9}">${i+1 }</c:when><c:otherwise>0${i }</c:otherwise></c:choose>:00</end>
			</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-block">
				<start checked="false">${i }:00</start> ~ <end>${i }:30</end>
			</button>
			<button type="button" class="btn btn-block">
				<start checked="false">${i }:30</start> ~ <end>${i+1 }:00</end>
			</button>
		</c:otherwise>
	</c:choose>
</c:forEach>



<button type="button" class="btn logPrint">
로그 출력</button>

<script>
	$('button.logPrint').on("click",function(){
		var hi = new FormData();
		$('button.btn-danger').each(function(){
			hi.append('bye',"오늘"+$(this).find("start").html())
			console.log($(this).html())
		})
		console.log("select : "+hi.getAll('bye'))
	})
	$('button.btn').on("click",function(){
		console.log("에잇")
		$(this).toggleClass("btn-danger")
		$(this).find("start").toggleClass("selectTime")
		$(this).find("start").toggleClass("seTime")
		$(this).find("end").toggleClass("selectTime")
	})
</script>
</body>
</html>


<%-- 
<table>
<thead><tr><th>예약 가능 시간</th></tr></thead>
<tbody>
<c:forEach begin="0" end="23" var="i">
	<c:choose>
		<c:when test="${i<10 }">
			<tr><td>
				<start checked="false">0${i }:00</start> ~ <end>0${i }:30</end>
			</td></tr>
			<tr><td>
				<start checked="false">0${i }:30</start> ~ <end><c:choose><c:when test="${i==9}">${i+1 }</c:when><c:otherwise>0${i }</c:otherwise></c:choose>:00</end>
			</td></tr>
		</c:when>
		<c:otherwise>
			<tr><td>
				<start checked="false">${i }:00</start> ~ <end>${i }:30</end>
			</td></tr>
			<tr><td>
				<start checked="false">${i }:30</start> ~ <end>${i+1 }:00</end>
			</td></tr>
		</c:otherwise>
	</c:choose>
</c:forEach>
</tbody>
</table>
 --%>