<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<style>
	#hosg{
		cursor: pointer;
		animation:box_ani 5s linear infinite alternate running;
	}
	#hosg:hover{
		animation-play-state: paused;
	}
	@keyframes box_ani{
    0%{transform:translate(0,0) scale(0.3,0.3) rotate(0deg);}
    10%{}
    20%{}
    30%{}
    40%{transform:translate(150px, 20px) scale(1,1) rotate(180deg);}
    70%{transform:translate(50px,70px) scale(0.7,0.7) rotate(270deg);}
    100%{transform:translate(0,0) scale(0.3,0.3) rotate(0deg);}
  }
</style>
<body>
	<a href="/board/list"><img src="${root }/image/title3.png" width="400" height="400" id="hosg"></a>
	<b>yoon hosg</b>
</body>
</html>