<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
#wrap {
	background-color: #2E2E2E;
	margin: 40px 480px;
	width: 450px;
	height: 630px;
	position: relative;

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 40px;
  border-radius: 4px;
  box-shadow: 0 15px 35px rgba(0,0,0,9);
  box-sizing: border-box;
}

.inputBox
{
  position: relative;
  width: 75%;
}
.inputBox input 
{
  position: relative;
  width: 100%;
  background: #333;
  border: none;
  outline: none;
  padding: 25px 10px 7.5px;
  border-radius: 4px;
  color: #fff;
  font-weight: 500;
  font-size: 1em;
}
.inputBox i 
{
  position: absolute;
  left: 0;
  padding: 15px 10px;
  font-style: normal;
  color: #aaa;
  transition: 0.5s;
  pointer-events: none;
}
.inputBox input:focus ~ i
{
  transform: translateY(-7.5px);
  font-size: 0.5em;
  color: #fff;
}
,
.inputBox input:valid ~ i{
	font-size: 0.8em;
  color: #fff;
  background: #333;
}
,
.inputBox input:not(:-ms-placeholder-shown) ~ i
{
  transform: translateY(-7.5px);
  font-size: 0.5em;
  color: #fff;
}
#login{
	float: right;
}
#sub
{
	border-radius: 4px;
  padding: 10px;
  background: #0f0;
  color: #000;
  font-weight: 600;
  font-size: 1.35em;
  letter-spacing: 0.05em;
  cursor: pointer;
}
a{
	color: #0f0;
  text-decoration: none;
}
</style>
<body>
	<form action="loginprocess" method="post">
		<div id="wrap">
			<div id="title" style="color: #0f0;font-size: 1.8em">로그인</div>
			<div class="inputBox"><input type="text" name="id" required="required" autofocus="autofocus"
			value="${sessionScope.saveok==null?'':sessionScope.myid }"><i>아이디</i></div>
			<div class="inputBox"><input type="password" name="pass" required="required"><i>비밀번호</i></div>
			
			<div id="login"><a href="/member/form">회원가입</a></div>
			<div>
				<button type="submit" id="sub">로그인</button><br>
				<input type="checkbox" name="save" value="yes" ${sessionScope.saveok==null?'':'checked' }><span style="color: white">아이디저장</span>
			</div>
			
		</div>
	</form>
</body>
</html>