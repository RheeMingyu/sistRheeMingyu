<%@page import="db.memo.MemoDto"%>
<%@page import="db.memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemoDao dao=new MemoDao();
	
	//인코딩
	request.setCharacterEncoding("utf-8");
	
	//데이터 읽기(writer,story,avatar)
	String writer=request.getParameter("writer");
	String story=request.getParameter("story");
	String avatar=request.getParameter("avatar");
	
	//dto로 묶기
	MemoDto dto=new MemoDto();
	
	dto.setWriter(writer);
	dto.setStory(story);
	dto.setAvatar(avatar);
	
	//insert
	dao.insertMemo(dto);
%>