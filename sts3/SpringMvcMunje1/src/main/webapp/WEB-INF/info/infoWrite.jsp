<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>결과출력</h2>
	<b style="font-size: 2em;">
		이름: ${dto.name }<br>
		좋아하는 색: <div style="width: 50px;height: 50px;background-color: ${dto.color}"></div><br>
		취미: 
		<%-- <c:forEach var="hobbies" items="${dto.hobby }">
			<c:out value="[${hobbies }] "/>
		</c:forEach><br> --%>
		<c:if test="${empty dto.hobby }">없음</c:if>
		<c:if test="${!empty dto.hobby}">
			<c:forEach var="h" items="${dto.hobby }">
				[${h }]
			</c:forEach>
		</c:if><br>
		가장 좋아하는 언어: ${dto.lang }
	</b>
</body>
</html>