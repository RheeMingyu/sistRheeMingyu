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
	<div style="margin: 50px 100px">
		<img src="../01.png">
		<button type="button" class="btn btn-info" onclick="location.href='carform'">자동차정보입력</button>
		<br>
		<h5 class="alert alert-info">
			<b>총 ${totalCount }개의 자동차 정보가 있습니다</b>
		</h5>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>차종</th>
				<th>가격</th>
				<th>색상</th>
				<th>구입일</th>
				<th>등록일</th>
				<th>편집</th>
			</tr>
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${dto.carname }<a href="detail?num=${dto.num }"><img src="../save/${dto.carphoto }" width="40" height="40" border="1" hspace="10"></a></td>
					<td><fmt:formatNumber value="${dto.carprice }" type="currency"/></td>
					<td><div style="background-color: ${dto.carcolor };width:30px;height:30px;border-radius:100px"></div></td>
					<td>${dto.carguip }</td>
					<td><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>
						<button type="button" class="btn btn-outline-info btn-sm"
						onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm"
						onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>