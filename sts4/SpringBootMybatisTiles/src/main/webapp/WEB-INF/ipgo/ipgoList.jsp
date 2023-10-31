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
	<div class="alert alert-info" style="width: 700px">
		<b>총 ${totalcount }개의 상품이 입고되었습니다</b>
	
	<table class="table table-bordered">
		<caption align="top">
			<span style="float: right">
				<button type="button" class="btn btn-outline-info" onclick="location.href='ipgoform'">상품추가</button>
			</span>
		</caption>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td width="400" rowspan="4">
					<c:if test="${dto.photoname!='no' }">
						<c:forTokens var="pho" items="${dto.photoname }" delims="," begin="0" end="0">
							<a href="content?num=${dto.num }">
								<img src="../upload/${pho }" style="width: 150px;height: 150px">
							</a>
						</c:forTokens>
					</c:if>
					<c:if test="${dto.photoname=='no' }">
						<a href="../image/noposter.png">
							<img src="../image/noposter.png" style="width: 150px;height: 150px">
						</a>
					</c:if>
				</td>
				<td><b>상품명: ${dto.sangpum }</b></td>
			</tr>
			<tr>
				<td><b>단가: <fmt:formatNumber value="${dto.price }" type="currency"/></b></td>
			</tr>
			<tr>
				<td><b>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd"/></b></td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>