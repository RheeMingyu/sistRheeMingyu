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
		<form action="update" method="post" enctype="multipart/form-data">
			<!-- hidden 5개 -->
			<input type="hidden" name="num"	value="${dto.num }">
			<input type="hidden" name="currentPage"	value="${currentPage }">
			<input type="hidden" name="regroup"	value="${dto.regroup }">
			<input type="hidden" name="restep" value="${dto.restep }">
			<input type="hidden" name="relevel"	value="${dto.relevel }">
			<table class="table table-bordered" style="width: 500px">
				<caption align="top"><b>
					<c:if test="${dto.num==0 }">새글쓰기</c:if>
					<c:if test="${dto.num!=0 }">답글쓰기</c:if>
				</b></caption>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" style="width: 130px" value="${dto.writer }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control" required="required" style="width: 130px" value="${dto.pass }">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="form-control" required="required" style="width: 300px" value="${dto.subject }">
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<input type="file" name="modimage" class="form-control" style="width: 250px" multiple="multiple">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea style="width: 480px;height: 130px" name="content" required="required" class="form-control">${dto.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">
							<c:if test="${dto.relevel==0 }">원글 수정</c:if>
							<c:if test="${dto.relevel==1 }">답글 수정</c:if>
							<c:if test="${dto.relevel>1 }">답답글 수정</c:if>
						</button>
						<button type="button" class="btn btn-outline-success" onclick="location.href='list'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>