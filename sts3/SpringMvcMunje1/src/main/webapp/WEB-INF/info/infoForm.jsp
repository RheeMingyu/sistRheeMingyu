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
	<form action="result" method="post">
		<table class="table table-bordered" style="width: 400px">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control" style="width: 120px"></td>
			</tr>
			<tr>
				<th>좋아하는 색</th>
				<td><input type="color" name="color" class="form-control" style="width: 120px"></td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="축구">축구
					<input type="checkbox" name="hobby" value="야구">야구
					<input type="checkbox" name="hobby" value="농구">농구
					<input type="checkbox" name="hobby" value="배구">배구
					<input type="checkbox" name="hobby" value="당구">당구
				</td>
			</tr>
			<tr>
				<th>좋아하는 언어</th>
				<td>
					<select name="lang">
						<option value="java">java</option>
						<option value="html">html</option>
						<option value="oracle">oracle</option>
						<option value="jsp">jsp</option>
						<option value="spring">spring</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info" style="width: 100px">전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>