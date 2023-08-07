<%@page import="model.intro.IntroDao"%>
<%@page import="model.intro.IntroDto"%>
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
	
	String name=request.getParameter("name");
	String blood=request.getParameter("blood");
	String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String city=request.getParameter("city");
	
	IntroDto dto=new IntroDto();
	dto.setIntro_name(name);
	dto.setIntro_blood(blood);
	dto.setIntro_hp(hp);
	dto.setIntro_city(city);
	
	IntroDao dao=new IntroDao();
	dao.insertIntro(dto);
	
	response.sendRedirect("list.jsp");
	%>
</body>
</html>