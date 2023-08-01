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
	String mds=request.getParameter("merchandise");
	String size=request.getParameter("size");
	String [] color=request.getParameterValues("color");
	String [] extra=request.getParameterValues("extra");
	%>
	
	<div style="font-size:2em;">
		상품명:<%=mds %><br>
		사이즈:<%=size %><br>
		선택 색상:
		<%
		if(color==null)
		{%>
			기본색상 제공
		<%}
		else
		{
			for(int i=0;i<color.length;i++)
			{%>
				<%=color[i] %>&nbsp;
			<%}%>
			<br>
			<%
			for(int i=0;i<color.length;i++)
			{%>
				<div style="background-color:<%=color[i] %>; width:50px; height:50px; float:left"></div>
			<%}
		}%>
		<br><br>
		추가 상품:
		<%
		for(int i=0;i<extra.length;i++)
		{%>
			<%=extra[i] %>&nbsp;
		<%}
		%>
	</div>
</body>
</html>