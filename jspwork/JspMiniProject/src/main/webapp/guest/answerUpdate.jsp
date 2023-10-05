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
	
	String content=request.getParameter("content");
	String idx=request.getParameter("idx");
	
	AnswerDto dto=new AnswerDto();
	dto.setIdx(idx);
	dto.setContent(content);
	
	AnswerDao dao=new AnswerDao();
	dao.updateAnswer(dto);
	
	//response.sendRedirect("../index.jsp?main=guest/guestList.jsp");
	%>
</body>
</html>