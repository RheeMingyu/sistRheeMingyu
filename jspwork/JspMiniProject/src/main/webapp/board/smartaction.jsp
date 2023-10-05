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
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="data.dto.SmartDto"/>
	<jsp:useBean id="dao" class="data.dao.SmartDao"/>
	
	<jsp:setProperty property="*" name="dto"/>
	<%
	dao.insertSmart(dto);
	
	int num=dao.getMaxNum();
	response.sendRedirect("../index.jsp?main=board/contentView.jsp?num="+num+"&currentPage=1");
	%>
</body>
</html>