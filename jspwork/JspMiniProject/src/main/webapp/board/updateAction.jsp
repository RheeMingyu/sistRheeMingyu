<%@page import="data.dto.SmartDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	String num=request.getParameter("num");
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String currentPage=request.getParameter("currentPage");
	
	SmartDto dto=new SmartDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	
	SmartDao dao=new SmartDao();
	dao.updateSmart(dto);
	
	response.sendRedirect("../index.jsp?main=board/contentView.jsp?num="+num+"&currentPage="+currentPage);
	%>
</body>
</html>