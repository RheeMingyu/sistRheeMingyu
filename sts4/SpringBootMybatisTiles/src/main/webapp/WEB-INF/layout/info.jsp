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
<body>
	<c:if test="${loginok==null }">
		<a href="#"><img src="${root }/image/infoemo.png" width="148" height="80"></a>
	</c:if>
	<c:if test="${loginok!=null }">
		<a href="#"><img src="${root }/membersave/${sessionScope.loginphoto}" width="148" height="80"></a>
	</c:if>
	<b style="font-size: 1.4em">
		대충 목록1: 대충 내용<br><br>
		다른 목록2: 다른 내용<br><br>
		빈칸 때움: 내용 없음<br><br>
		여기까지: 더는 없음<br><br>
	</b>
</body>
</html>