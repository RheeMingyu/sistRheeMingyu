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
	<c:if test="${count==0 }">
		<h2 class="alert alert-info">등록된 고객정보가 없습니다</h2>
	</c:if>
	<c:if test="${count>0 }">
		<h2 class="alert alert-info">총 ${count }명의 고객이 있습니다</h2>
	</c:if>
	<button type="button" onclick="location.href='writeForm'">고객추가</button>
	<hr>
	
	<table class="table table-bordered" style="width: 700px">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>연락처</th>
			<th>주소</th>
			<th>가입일</th>
			<th>편집</th>
		</tr>
		<c:forEach var="m" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${m.name }</td>
				<td>${m.hp }</td>
				<td>${m.addr }</td>
				<td><fmt:formatDate value="${m.gaipday }" pattern="yyyy-MM-dd"/></td>
				<td>
					<button type="button" class="btn btn-outline-info" onclick="location.href='updateForm?num=${m.num}'">수정</button>
					<button type="button" class="btn btn-outline-info" onclick="location.href='delete?num=${m.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>