<%@page import="member.model.MemberDao"%>
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
<body>
	<%
	String id=(String)session.getAttribute("id");
	
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
	%>
	<div style="margin: 50px">
		<b><%=name %> is staying signed in now</b><br><br>
		<input type="button" value="Sign Out" class="btn btn-warning" onclick="location.href='logoutAction.jsp'">&nbsp;
	 	<input type="button" value="Members" class="btn btn-info" onclick="location.href='../member/memberList.jsp?id=<%=id %>&name=<%=name %>'">
	</div>
</body>
</html>