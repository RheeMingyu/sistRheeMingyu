<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
String nick=request.getParameter("nick");
String pass=request.getParameter("pass");
String image=request.getParameter("image");
String story=request.getParameter("story");

SimpleGuestDto dto=new SimpleGuestDto();

dto.setNick(nick);
dto.setPass(pass);
dto.setImage(image);
dto.setStory(story);

SimpleGuestDao dao=new SimpleGuestDao();
dao.insertGuest(dto);

response.sendRedirect("guestList.jsp");
%> --%>

<!-- 자바빈즈로 변경하려면?
	useBean은 new로 객체를 생성하는것과 같다
	id는 참조변수명과 유사한 기능 -->
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="db.simpleguest.SimpleGuestDao"/>
<jsp:useBean id="dto" class="db.simpleguest.SimpleGuestDto"/>

<jsp:setProperty property="*" name="dto"/>
<!-- 호출할 객체의 id를 name 값으로 입력,property는 set할 변수(*),자동setting -->
<!-- multi 쓸때,조건문(삼항연산자 등) 들어갈 때는 안됨 -->
<%
dao.insertGuest(dto);

response.sendRedirect("guestList.jsp");
%>