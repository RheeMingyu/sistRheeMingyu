<%@page import="db.ajaxboard.AjaxBoardDto"%>
<%@page import="db.ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String avatar=request.getParameter("avatar");
String story=request.getParameter("story");

AjaxBoardDao dao=new AjaxBoardDao();
AjaxBoardDto dto=new AjaxBoardDto();

dto.setWriter(writer);
dto.setSubject(subject);
dto.setAvatar(avatar);
dto.setStory(story);

dao.insertBoard(dto);
%>