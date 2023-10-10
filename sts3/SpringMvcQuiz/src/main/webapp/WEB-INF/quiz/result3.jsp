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
	<table class="table table-bordered" style="width: 300px">
		<tr>
			<th>상품명</th><td>${dto.sang }</td>
		</tr>
		<tr>
			<th>카테고리</th><td>${dto.cat }</td>
		</tr>
		<tr>
			<th>색상</th><td>${dto.color }</td>
		</tr>
		<tr>
			<th>가격</th><td>${dto.price }</td>
		</tr>
	</table>
</body>
</html>