<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.intro.IntroDto"%>
<%@page import="model.intro.IntroDao"%>
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
	String num=request.getParameter("num");
	
	IntroDao dao=new IntroDao();
	IntroDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	%>
	<table class="table table-bordered" style="width: 300px">
		<tr align="center">
			<th>이름</th>
			<td><%=dto.getIntro_name() %></td>
		</tr>
		<tr align="center">
			<th>혈액형</th>
			<td><%=dto.getIntro_blood() %></td>
		</tr>
		<tr align="center">
			<th>연락처</th>
			<td><%=dto.getIntro_hp() %></td>
		</tr>
		<tr align="center">
			<th>거주지</th>
			<td><%=dto.getIntro_city() %></td>
		</tr>
		<tr align="center">
			<th>작성일</th>
			<td><%=sdf.format(dto.getGaipday()) %></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="history.back()" class="btn btn-success">목록</button>
			</td>
		</tr>
	</table>
</body>
</html>