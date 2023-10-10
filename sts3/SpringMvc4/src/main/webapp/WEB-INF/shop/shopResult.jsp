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
	<h2>상품정보 출력_dto</h2>
	<div style="color: ${shopDto.color}">
		상품명: ${shopDto.sang }<br>
		수량: <fmt:formatNumber value="${shopDto.su }" pattern="#,##0"/><br>
		단가: <fmt:formatNumber value="${shopDto.price }" type="currency"/><br>
		총금액: <fmt:formatNumber value="${shopDto.su*shopDto.price }" type="currency"/>
	</div>
</body>
</html>