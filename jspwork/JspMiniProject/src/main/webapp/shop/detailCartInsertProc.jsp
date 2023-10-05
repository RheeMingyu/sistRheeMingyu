<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.ShopDao"/>
<jsp:useBean id="cdto" class="data.dto.CartDto"/>

<jsp:setProperty property="*" name="cdto"/>
<%
	dao.insertCart(cdto);
%>