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
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String save=request.getParameter("savecheck");
	
	MemberDao dao=new MemberDao();
	boolean flag=dao.authentification(id, pass);
	
	if(flag)
	{
		session.setAttribute("loginstatus", "on");
		session.setAttribute("id", id);
		session.setAttribute("save", save);
		
		session.setMaxInactiveInterval(60*30);
		
		response.sendRedirect("loginMain.jsp");
	}
	else
	{%>
		<script>
			alert("ID and password is not corresponding");
			history.back();
		</script>
	<%}
	%>
</body>
</html>