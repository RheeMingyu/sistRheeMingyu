<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
String num=request.getParameter("num");

SimpleGuestDao dao=new SimpleGuestDao();
SimpleGuestDto dto=dao.getData(num);
%>
<body>
	<div style="margin:50px">
		<form action="updateAction.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>">
			<table class="table table-bordered" style="width: 700px">
				<caption align="top"><b>간단 방명록</b></caption>
				<tr>
					<th width="80" style="background-color: aqua">닉네임</th>
					<td>
						<input type="text" name="nick" required="required" style="width:120px" value="<%=dto.getNick() %>">
					</td>
					<th width="85" style="background-color: aqua">비밀번호</th>
					<td>
						<input type="password" name="pass" required="required" style="width:120px" value="<%=dto.getPass() %>">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<%
						for(int i=1;i<=10;i++)
						{%>
							<input type="radio" name="image" <%=dto.getImage().equals(i!=10?"0"+i:""+i)?"checked":"" %> value="<%=i!=10?"0"+i:i %>"><img src="../image/cartoon/<%=i!=10?"0"+i:i %>.png" width="50">
						<%}%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea style="width:700px;height:150px" name="story"><%=dto.getStory() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="submit" value="저장" class="btn btn-outline-info">저장</button>
						<button type="button" value="목록" class="btn btn-outline-success" onclick="location.href='guestList.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>