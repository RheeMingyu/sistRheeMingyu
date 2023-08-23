<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="db.quiz.QuizBoardDao"%>
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
<body>
	<%
	String num=request.getParameter("num");
	QuizBoardDao dao=new QuizBoardDao();
	//dao.updateViewCount(num);
	QuizBoardDto dto=dao.getSingleData(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
	<div style="margin: 30px 30px">
		<table class="table table-bordered" style="width: 700px">
			<caption align="top"><b><%=dto.getTitle() %></b>
			<button type="button" class="btn btn-outline-success btn-sm" style="float: right;margin-left: 3px" onclick="location.href='quizForm.jsp'"><i class="bi bi-pencil-square"></i></button>
			<button type="button" class="btn btn-outline-dark  btn-sm" style="width: 35px;height: 30px;float: right;" onclick="location.href='quizList.jsp'"><i class="bi bi-card-list"></i></button></caption>
			<tr>
				<td>
					<b>작성자: <%=dto.getWriter() %></b><br>
					<span class="day" style="float: right;color: gray"><%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;
					조회: <%=dto.getViewcount() %></span>
				</td>
			</tr>
			<tr height="150">
				<td><%=dto.getContent() %><img src="../upload/<%=dto.getImgname() %>" style="float: right;width: 100px"></td>
			</tr>
		</table>
	</div>
</body>
</body>
</html>