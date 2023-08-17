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
	session.setAttribute("msg", "happy");
	session.setMaxInactiveInterval(10); //인자값 안주면 기본값 30분
	%>
	<h2>10초안에 눌러주세요!!!</h2>
	<form action="sessionAction.jsp" method="post">
		<h2>가고싶은 여행지</h2>
		<input type="radio" value="베트남 3박4일" name="travel" checked>베트남 3박4일&nbsp;
		<input type="radio" value="태국 4박5일" name="travel">태국 4박5일&nbsp;
		<input type="radio" value="필리핀 6박7일" name="travel">필리핀 6박7일&nbsp;
		<input type="radio" value="대만 2박3일" name="travel">대만 2박3일&nbsp;
		<input type="radio" value="캄보디아 3박4일" name="travel">캄보디아 3박4일&nbsp;<br>
		<input value="여행당첨" type="submit">
	</form>
</body>
</html>