<%@page import="org.json.simple.JSONObject"%>
<%@page import="db.ajaxboard.AjaxBoardDto"%>
<%@page import="db.ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String subject=request.getParameter("usubject");
String story=request.getParameter("ustory");
String avatar=request.getParameter("uavatar");


AjaxBoardDto dto=new AjaxBoardDto();

dto.setNum(num);
dto.setWriter(writer);
dto.setSubject(subject);
dto.setStory(story);
dto.setAvatar(avatar);

AjaxBoardDao dao=new AjaxBoardDao();

dao.updateBoard(dto);

JSONObject ob=new JSONObject();

ob.put("writer",dto.getWriter());
ob.put("subject",dto.getSubject());
ob.put("story",dto.getStory());
ob.put("avatar",dto.getAvatar());
%>
<%=ob.toString() %>