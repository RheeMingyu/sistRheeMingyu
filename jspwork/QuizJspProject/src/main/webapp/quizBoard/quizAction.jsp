<%@page import="db.quiz.QuizBoardDao"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	ServletContext context=getServletContext();
	String realFolder=context.getRealPath("/upload");
	System.out.println("업로드경로:"+realFolder);
	int fileSize=1024*1024*5;
	
	try{
	MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,"utf-8",new DefaultFileRenamePolicy());
	
	String writer=multi.getParameter("writer");
	String title=multi.getParameter("title");
	String content=multi.getParameter("content");
	String imgname=multi.getFilesystemName("imgname");
	
	QuizBoardDto dto=new QuizBoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content.replace("\n", "<br>"));
	dto.setImgname(imgname);
	
	QuizBoardDao dao=new QuizBoardDao();
	dao.insertQuiz(dto);
	
	response.sendRedirect("quizList.jsp");
	
	}catch(Exception e){
	
	}%>
</body>
</html>