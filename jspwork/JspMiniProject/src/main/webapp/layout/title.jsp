<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
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
	<%
	//절대경로잡기
	String root=request.getContextPath();
	MemberDao dao=new MemberDao();
	String loginOk=(String)session.getAttribute("loginOk");
	String name="";
	if(loginOk!=null)
	{
		String id=(String)session.getAttribute("myId");
		name=dao.getNameFromId(id);
	}
	%>
</head>
<style>
	div.cart{
		float: right;
		cursor: pointer;
	}
	div.count{
		width: 30px;
		height: 30px;
		float: right;
		background-color: red;
		border-radius: 100px;
		text-align: center;
		line-height: 30px;
		z-index: 10;
		position: relative;
		left: -20px;
		top: 10px;
		color: white;
	}
</style>
<script>
	$(function(){
		$("div.cart").click(function(){
			location.href="index.jsp?main=shop/myCart.jsp";
		});
	});
</script>
<body>
	<a href="<%=root %>" style="color: black;"><img src="<%=root%>/image2/sistgood.png" style="width: 200px;"></a>
	<%
	if(loginOk!=null)
	{%>
		<b><%=name %> 님이 로그인 중입니다</b>
		<button type="button" class="btn btn-danger" onclick="location.href='login/logoutProc.jsp'">로그아웃</button>
	<%}else
	{%>
		<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginForm.jsp'">로그인</button>
	<%}%>
	<br>쌍용교육센터
	
	<div class="cart">
		<%
		ShopDao sdao=new ShopDao();
		int cartSize=sdao.getCartList((String)session.getAttribute("myId")).size();
		%>
		<i class="bi bi-cart fs-3"></i>
		<div class="count"><%=cartSize %></div>
	</div>
</body>
</html>