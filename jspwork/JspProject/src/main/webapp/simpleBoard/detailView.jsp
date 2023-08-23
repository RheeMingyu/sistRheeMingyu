<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.SimpleBoardDto"%>
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
<style>
	span.day{
		color: gray;
	}
</style>
<body>
	<jsp:useBean id="dao" class="db.simpleboard.SimpleBoardDao"/>
	<%
	//num을 읽는다
	String num=request.getParameter("num");
	SimpleBoardDto dto=dao.getBoardFromNum(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//조회수 1증가
	dao.updateViewCount(num);
	%>
	<div style="margin: 30px 30px">
		<table class="table table-bordered">
			<caption align="top"><b><%=dto.getSubject() %></b></caption>
			<tr>
				<td>
					<b>작성자: <%=dto.getWriter() %></b><br>
					<span class="day"><%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;
					조회: <%=dto.getViewcount() %></span>
				</td>
			</tr>
			<tr height="150">
				<td>
				<!-- pre태그안에 쓰거나 replace()이용:db저장시 br태그가 \n으로 저장된다..그러므로 출력시 다시 br로변환 -->
					<%=dto.getStory().replace("\n", "<br>") %>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'"><i class="bi bi-pencil-fill">글쓰기</i></button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='boardList.jsp'"><i class="bi bi-card-list"></i>목록</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='updatePassForm.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-file-earmark-diff">수정</i></button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-trash3-fill">삭제</i></button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>