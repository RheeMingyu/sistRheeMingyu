<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
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
	<script>
		var pass=prompt("authenticate your password");
		console.log(<%=dto.getPass() %>);
	
		if(pass==<%=dto.getPass() %>)
			location.href="updateForm.jsp?num=<%=num %>";
		else
		{
			alert("password is wrong");
			location.href="guestList.jsp";
		}
	</script>
</body>
</html>