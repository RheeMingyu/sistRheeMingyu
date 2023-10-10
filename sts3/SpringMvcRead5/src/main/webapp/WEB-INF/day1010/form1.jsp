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
	<form action="read1" method="post">
		<table class="table table-bordered" style="width: 400px">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control" style="width: 120px"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남" checked="checked">남
					&nbsp;&nbsp;<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<th>주거지역</th>
				<td>
					<select name="addr">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="제주">제주</option>
						<option value="세종">세종</option>
						<option value="부산">부산</option>
					</select>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-warning" style="width: 100px">전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>