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
	<div style="margin: 100px 100px;">
		<form action="update" method="post">
		<input type="hidden" name="num" value="${mdto.num }">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top"><b>회원가입</b></caption>
				<tr>
					<td rowspan="5" align="center" style="width: 250px">
						<img src="../membersave/${mdto.photo }">
					</td>
					<td>
						<div class="d-inline-flex" style="height: 40px">
						<input type="text" readonly="readonly" name="id" id="id" class="form-control" style="width: 120px" value="${mdto.name }">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="d-inline-flex" style="height: 40px">
						<input type="password" style="width: 120px" class="form-control" name="pass" id="pass" readonly="readonly" value="${mdto.pass}">&nbsp;
						<input type="password" style="width: 120px" class="form-control" name="pass2" id="pass2" readonly="readonly" value="${mdto.pass }">&nbsp;&nbsp;
						</div>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="name" class="form-control" placeholder="이름" required="required" style="width: 150px" value="${mdto.name }">
				</tr>
				<tr>
					<td>
						<input type="text" name="email" class="form-control" placeholder="이메일" required="required" style="width: 250px" value="${mdto.email }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="addr" class="form-control" placeholder="주소" required="required" style="width: 550px" value="${mdto.addr }">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">수정</button>
						<button type="button" class="btn btn-outline-info" onclick="location.href=''">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>