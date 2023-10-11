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
		<h3 class="alert alert-info">저장된 차의 정보가 없습니다</h3>
	</c:if>
	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">${totalCount }개의 자동차가 등록되었습니다</h3>
	</c:if>
	
	<button type="button" onclick="location.href='writeForm'">차 정보 입력</button>
	
	<hr>
	<table class="table table-bordered" style="width: 700px">
		<tr>
			<th width="60">번호</th>
			<th width="60">차종</th>
			<th width="60">색상</th>
			<th width="60">가격</th>
			<th width="80">구입일</th>
			<th width="80">편집</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.carname }</td>
				<td><div style="width: 20px;height: 20px;background-color: ${dto.carcolor}"></div></td>
				<td><fmt:formatNumber value="${dto.carprice }" type="currency"/>
				<td>${dto.carguip }</td>
				<td>
					<button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='updateForm?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='deleteForm?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>