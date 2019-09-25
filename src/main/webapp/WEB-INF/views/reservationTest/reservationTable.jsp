<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="border:1px solid;border-collapse:collapse;text-align: center;" >
<thead>
<tr>
<td rowspan="2">이전 일주일</td>
<td colspan="7">2019년 9월</td>
<td rowspan="2">다음 일주일</td>
</tr>
<tr>
<td>일</td>
<td>월</td>
<td>화</td>
<td>수</td>
<td>목</td>
<td>금</td>
<td>토</td>
</tr>
</thead>
<tbody>
<c:forEach begin="0" end="${timeList.size()-1 }" var="i">
<tr>
<td>
${timeList[i] }
</td>
	<c:forEach begin="0" end="6" var="j">
	<td>
	<c:choose>
 		<c:when test="${currentDate > list[j*timeList.size()+i].startTimeDate }">
			X
		</c:when>
		<c:when test="${list[j*timeList.size()+i].arranged != 1 }">
			X
		</c:when>
		<c:otherwise>	
			O
		</c:otherwise>		
	</c:choose>
	</td>
	</c:forEach>
<td>
${timeList[i] }
</td>
</tr>
</c:forEach>
<!-- <tr>
	<td>10:00</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>10:00</td>
</tr>
<tr>
	<td>10:30</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>10:30</td>
</tr>
<tr>
	<td>11:00</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>O</td>
	<td>11:00</td>
</tr> -->
</tbody>
</table>
</body>
</html>