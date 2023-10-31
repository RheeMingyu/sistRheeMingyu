<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
	div.layout div{
		border: 0px solid black;
	}
	div.layout div.title{
		position: absolute;
		top: 170px;
		left: 480px;
		height: 130px;
	}
	div.layout div.menu{
		position: absolute;
		top: 700px;
		left: 40px;
		width: 1320px;
		height: 65px;
	}
	div.layout div.main{
		position: absolute;
		top: 250px;
		left: 50px;
		width: 1400px;
		height: 600px;
		font-family: Dongle;
		font-size: 17px;
	}
	div.layout div.info{
		position: absolute;
		top: 170px;
		left: 1000px;
		width: 150px;
		height: 600px;
		font-family: Dongle;
		font-size: 17px;
		border: 0px solid black;
	}
</style>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title3"/>
		</div>
		<div class="info">
			<tiles:insertAttribute name="info3"/>
		</div>
	</div>
</body>
</html>