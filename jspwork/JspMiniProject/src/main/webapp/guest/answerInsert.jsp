<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
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
	request.setCharacterEncoding("utf-8");
	
	String num=request.getParameter("num");
	String myid=request.getParameter("myid");
	String currentPage=request.getParameter("currentPage");
	String content=request.getParameter("content");
	
	AnswerDto dto=new AnswerDto();
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setContent(content);
	
	AnswerDao dao=new AnswerDao();
	dao.insertAnswer(dto);
	
	response.sendRedirect("../index.jsp?main=guest/guestList.jsp?currentPage="+currentPage);
	%>
</body>
</html>