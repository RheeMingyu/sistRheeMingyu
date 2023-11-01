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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 50px 150px">
		<table class="table table-bordered" style="width: 600px">
			<tr>
				<td>
					<h4>
						<b>${dto.subject }</b>
						<span style="font-size: 12pt;color: gray;float: right">
							<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</h4>
					<span>작성자: ${dto.name } (${dto.myid })</span>
					<c:if test="${dto.uploadfile!='no' }">
						<span style="float: right"><a href="download?clip=${dto.uploadfile }">
							<i class="bi bi-arrow-down-circle"></i>&nbsp;<b>${dto.uploadfile }</b></a>
						</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test="${bupload}">
						<img src="../savefile/${dto.uploadfile }" style="width: 200px"><br>
					</c:if>
					<pre>${dto.content }</pre>
					<b>조회수: ${dto.viewcount }</b>
				</td>
			</tr>
			<tr>
				<td align="right">
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-outline-success" onclick="loaction.href='form'">글쓰기</button>
					</c:if>
					<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
						<button type="button" class="btn btn-outline-info" onclick="loaction.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="loaction.href='delete?num=${dto.num}'">삭제</button>
					</c:if>
					<button type="button" class="btn btn-outline-light" onclick="loaction.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>