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
		top: 10px;
		left: 400px;
		height: 130px;
	}
	div.layout div.menu{
		position: absolute;
		top: 180px;
		left: 290px;
		width: 1090px;
		height: 65px;
	}
	div.layout div.info{
		position: absolute;
		top: 270px;
		left: 50px;
		width: 150px;
		height: 600px;
		font-family: Dongle;
		font-size: 17px;
		border: 1px solid black;
	}
	div.layout div.main{
		position: absolute;
		top: 270px;
		left: 250px;
		width: 1200px;
		height: 600px;
		font-family: Dongle;
		font-size: 2.5em;
	}
</style>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title"/>
		</div>
		<div class="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div class="info">
			<tiles:insertAttribute name="info"/>
		</div>
		<div class="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
</body>
</html>