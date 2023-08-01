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
	String name=request.getParameter("irum");
	String birth=request.getParameter("birth");
	//select가 multiple인 경우는
	//getParameterValues로 읽는다 (반환타입이 String[])
	
	//이때 선택하지 않으면 null이 되고 선택하면 배열로 값이 넘어온다
	String [] hobby=request.getParameterValues("hobby");
	%>
	<h3 class="alert alert-info">폼태그로 부터 읽은값</h3>
	이름:<%=name %><br>
	생년월일:<%=birth %><br>
	취미:
	<%
	if(hobby==null){%>
		취미없음
	<%}
	else
	{
		for(int i=0;i<hobby.length;i++){%>
			<%=hobby[i] %>&nbsp;
	<%}
	}
	%>
</body>
</html>