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
	<div style="margin: 100px 50px">
		<form action="read" method="post">
			<table class="table table-bordered" style="width: 350px">
				<tr>
					<th>차종</th>
					<td><input type="text" name="carname" class="form-control" required="required"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="carprice" class="form-control" required="required"></td>
				</tr>
				<tr>
					<th>색상</th>
					<td><input type="color" name="carcolor" class="form-control" required="required"></td>
				</tr>
				<tr>
					<th>구입일</th>
					<td><input type="date" name="carguip" class="form-control" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">DB저장</button>
						<button type="button" class="btn btn-success" onclick="location.href='list'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>