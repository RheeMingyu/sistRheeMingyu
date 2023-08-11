<%@page import="java.sql.Timestamp"%>
<%@page import="db.memo.MemoDto"%>
<%@page import="db.memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String story=request.getParameter("ustory");
String avatar=request.getParameter("uavatar");

MemoDto dto=new MemoDto();

dto.setNum(num);
dto.setWriter(writer);
dto.setStory(story);
dto.setAvatar(avatar);

MemoDao dao=new MemoDao();
dao.updateMemo(dto);
%>