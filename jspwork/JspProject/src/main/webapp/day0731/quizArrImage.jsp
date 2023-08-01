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
	<!-- 01~20.png 4행5열로 출력 -->
	<table>
		<%
		int n=0;
		for(int i=0;i<4;i++)
		{%>
			<tr>
				<%
				for(int j=0;j<5;j++)
				{
					n++;
				%>
					<td><img src="../image/cartoon/<%=n<10?"0"+n:n %>.png"></td>
				<%}
				%>
			</tr>
		<%}
		%>
	</table>
</body>
</html>