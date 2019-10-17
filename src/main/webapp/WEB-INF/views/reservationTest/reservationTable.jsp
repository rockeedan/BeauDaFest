<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${reservation==1 }">	
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
	</c:when>
	<c:otherwise>
		해당 일에 일정이 있습니다.<br>
		수정은 주간일정에서 가능합니다.
	</c:otherwise>
</c:choose>