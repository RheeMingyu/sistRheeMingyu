<%@page import="db.simpleboard.SimpleBoardDto"%>
<%@page import="db.simpleboard.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
	<%
	String num=request.getParameter("num");
	SimpleBoardDao dao=new SimpleBoardDao();
	SimpleBoardDto dto=dao.getBoardFromNum(num);
	%>
<body>
	<div style="margin: 30px 30px;width: 400px">
		<form action="updateAction.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>">
			<table class="table table-bordered">
				<caption align="top"><i class="bi bi-file-earmark-plus-fill"></i>글 수정</caption>
				<tr>
					<th style="background-color: magenta;">작성자</th>
					<td><input type="text" name="writer" class="form-control" required="required" autofocus="autofocus" style="width: 150px" value="<%=dto.getWriter() %>">
				</tr>
				<tr>
					<th style="background-color: magenta;">비밀번호</th>
					<td><input type="password" name="pass" class="form-control" required="required" style="width: 150px" value="<%=dto.getPass() %>">
				</tr>
				<tr>
					<th style="background-color: magenta;">제목</th>
					<td><input type="text" name="subject" class="form-control" required="required" style="width: 270px" value="<%=dto.getSubject() %>">
				</tr>
				<tr>
					<td colspan="2">
						<textarea style="width: 390px;height: 150px" class="form-control" required="required" name="story"><%=dto.getStory() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<!-- <button type="submit" class="btn btn-outline-info"><i class="bi bi-save">제출</i></button>
					<button type="button" onclick="location.href='boardList.jsp'" class="btn btn-outline-success"><i class="bi bi-card-list">목록</i></button> -->
					<input type="image" src="../image/cartoon/01.png" style="width: 70px">제출
					<input type="image" src="../image/cartoon/02.png" style="width: 70px" onclick="location.href='boardList.jsp';return false;">목록
					</td> <!-- type이 submit,image 모두 submit기능가능 -->
				</tr>
			</table>
		</form>
	</div>
</body>
</html>