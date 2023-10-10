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
	<h2>학생점수 출력_map</h2>
	<div>
		학생명: ${name }<br>
		자바: ${java }<br>
		스프링: ${spring }<br>
		제이커리: ${jquery }<br>
		<c:set var="tot" value="${java+spring+jquery }"/>
		<c:set var="avg" value="${tot/3 }"/>
		총합: ${tot }<br>
		평균: <fmt:formatNumber value="${avg }" pattern="###.##"></fmt:formatNumber>
	</div>
</body>
</html>