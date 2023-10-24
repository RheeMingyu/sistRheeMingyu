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
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-dark" style="width: 400px;margin: 50px 50px">
			<caption align="top">영화정보 추가</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="mv_title" class="form-control" required="required">
			</tr>
			<tr>
				<th>감독</th>
				<td><input type="text" name="mv_director" class="form-control" required="required">
			</tr>
			<tr>
				<th>포스터</th>
				<td><input type="file" name="multi" class="form-control">
			</tr>
			<tr>
				<th>개봉일</th>
				<td><input type="date" name="mv_opendate" class="form-control" required="required" value="2023-10-24">
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-light">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>