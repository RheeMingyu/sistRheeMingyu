<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3 class="alert alert-danger">${count }명 데이터 보유</h3>
	<br>
	<button type="button" class="btn btn-info btn-sm" onclick="location.href='addForm'">글쓰기</button>
	<hr>
	
	<table class="table table-bordered" style="width: 800px">
		<tr>
			<th width="60">번호</th>
			<th width="120">이름</th>
			<th width="100">사진</th>
			<th width="60">운전면허</th>
			<th width="200">주소</th>
			<th width="100">작성일</th>
			<th width="150">편집</th>
		</tr>
		<c:forEach var="info" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${info.name }</td>
				<td>
					<c:if test="${info.photo!='no' }">
						<img src="../photo/${info.photo }" width="50" height="50">
					</c:if>
				</td>
				<td>${info.driver }</td>
				<td>${info.addr }</td>
				<td><fmt:formatDate value="${info.gaipday }" pattern="yyyy-MM-dd"/>
				<td>
					<button type="button" class="btn btn-outline-info" onclick="location.href='uform?num=${info.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='delete?num=${info.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>