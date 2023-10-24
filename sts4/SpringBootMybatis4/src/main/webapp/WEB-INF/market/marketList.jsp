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
	<c:if test="${totalCount==0 }">
		<div class="alert alert-info">
			<b>저장된 상품정보가 없습니다</b>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-info">
			<b>총 ${totalCount }개의 상품정보가 있습니다</b>
		</div>
	</c:if>
	<div style="margin: 50px 100px">
		<button type="button" class="btn btn-info" onclick="location.href='writeform'">글쓰기</button>
	</div>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>입고일</th>
			<th>편집</th>
		</tr>
		<c:forEach var="mdto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${mdto.sang }<a><img src="../save/${mdto.photoname }" width="40" height="40"></a></td>
				<td><fmt:formatNumber value="${mdto.price }" type="currency"/></td>
				<td><fmt:formatDate value="${mdto.ipgoday }" pattern="yyyy-MM-dd"/></td>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-outline-info" onclick="location.href='updateform?num=${mdto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='delete?num=${mdto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>