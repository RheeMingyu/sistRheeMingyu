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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		
		$("#btnloginok").click(function(){
			var id=$("#loginid").val();
			var pass=$("#loginpass").val();
			//alert(id+","+pass);
			$.ajax({
				type:"get",
				url:"/member/login",
				dataType:"json",
				data:{"id":id,"pass":pass},
				success:function(res){
					if(res.result=="fail"){
						alert("아이디와 비밀번호를 확인해주세요");
						$("#loginid").val("");
						$("#loginpass").val("");
					}else{
						location.reload();
					}
				}
			});
		});
		
		$("#btnlogout").click(function(){
			
			$.ajax({
				type:"get",
				url:"/member/logout",
				dataType:"html",
				success:function(){
					alert("로그아웃 되었습니다");
					location.reload();
				}
			});
		});
	});
</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<a href="/"><img src="${root }/image/title2.png" height="100"></a>
	<marquee><b>SpringBootMybatis_Tiles</b></marquee>
	<c:if test="${sessionScope.loginok==null }">
		<button type="button" class="btn btn-outline-success"
		onclick="location.href='${root}/login/main'">Login</button>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" id="btnlogin">
	      AjaxLogIn
	    </button>
	</c:if>
	<c:if test="${sessionScope.loginok!=null }">
		<b>${sessionScope.myid } 님이 로그인중</b>
		<button type="button" class="btn btn-outline-success"
		onclick="location.href='${root}/login/logoutprocess'">Logout</button>
		<button type="button" class="btn btn-primary" id="btnlogout">AjaxLogout</button>
	</c:if>
	
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 로그인</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<input type="text" placeholder="ID" name="id" id="loginid" class="form-control"><br>
	      	<input type="password" placeholder="Password" id="loginpass" name="pass" class="form-control"><br>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-success" id="btnloginok">로그인</button>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>