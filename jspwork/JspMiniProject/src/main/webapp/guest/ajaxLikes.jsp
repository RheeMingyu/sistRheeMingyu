<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	GuestDao dao=new GuestDao();
	
	dao.updateLikes(num);
	
	//증가된 likes값을 json형식으로 변환
	String likes=dao.getSingleData(num).getLikes();
	
	JSONObject ob=new JSONObject();
	ob.put("likes", likes);
%>

<%=ob.toString()%>