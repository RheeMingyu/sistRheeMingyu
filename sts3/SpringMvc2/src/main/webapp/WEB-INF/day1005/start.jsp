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
	<h2>안녕하세요 우리는 오늘부터 <br>스프링 MVC에 대해 공부합니다</h2>
	<h2>StartController로부터 포워드</h2>
	<b>이름:${requestScope.name }</b><br>
	<b>주소:${addr }</b>
	
	<h1 class="alert alert-info">매핑연습</h1>
	<ul>
		<li><a href="apple/list">apple/list</a></li>
		<li><a href="apple/list.do">apple/list.do</a></li>
		<li><a href="apple/list.kyh">apple/list.kyh</a></li>
		<li><a href="banana/insert">banana/insert</a></li>
		<li><a href="orange/delete">orange/delete</a></li>
	</ul>
	
	<h1 class="alert alert-info">이미지연습</h1>
	<ul>
		<li><a href="shop/detail">resource의 이미지출력</a></li>
		<li><a href="board/insert/data">WEB-INF의 이미지출력</a></li>
	</ul>
</body>
</html>