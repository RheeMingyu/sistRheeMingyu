<%@page import="data.dao.SmartDao"%>
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
	String nums=request.getParameter("nums");
	
	//컴마로 분리해서[]
	String [] num=nums.split(",");
	
	SmartDao dao=new SmartDao();
	//배열의 길이만큼 삭제하고 목록으로 가기
	for(String n:num)
	{
		dao.deleteSmart(n);
	}
	
	response.sendRedirect("../index.jsp?main=board/boardList.jsp");
	%>
</body>
</html>