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
		<table class="table table-bordered" style="width: 500px">
			<tr>
				<th>상품명</th>
				<td><input type="text" name="sangpum" class="form-control" required="required"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" class="form-control" required="required"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="multi" class="form-control" multiple="multiple"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">저장</button>
					<button type="button" class="btn btn-success">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>