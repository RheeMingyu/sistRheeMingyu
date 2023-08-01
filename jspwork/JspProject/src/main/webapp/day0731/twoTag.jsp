<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- twoInclude로 본인들 이름(name),주소(addr)를 전달 -->
	<jsp:include page="./twoInclude.jsp">
		<jsp:param value="이민규" name="name"/>
		<jsp:param value="서울시 중랑구 면목동" name="addr"/>
	</jsp:include>
</body>
</html>