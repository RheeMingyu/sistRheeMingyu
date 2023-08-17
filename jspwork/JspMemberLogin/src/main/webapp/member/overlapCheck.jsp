<%@page import="member.model.MemberDao"%>
<%@page import="member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	String key=request.getParameter("key"); //처음호출시 null
	
	if(key==null) //null일경우에는 폼을 나타낸다
	{%>
		<div style="margin: 10px 30px;">
			<form action="overlapCheck.jsp" method="post" class="form-inline">
				<b>Add your New ID</b><br><br>
				<input type="hidden" name="key" value="yes">
				<input type="text" name="id" class="form-control" style="width: 120px;float: left">&nbsp;
				<button type="submit" class="btn btn-success">Overlap Check</button>
			</form>
		</div>
	<%}else{
		//action처리
		String id=request.getParameter("id");
		
		//dao에서 id존재유무에 관한 메서드..
		MemberDao dao=new MemberDao();
		boolean b=dao.overlapCheck(id);
		
		if(b)
		{ //존재하는경우 %>
			<div style="margin: 10px 30px">
				<h5>▷<%=id %>◁ is already signed up</h5>
				<img src="../image/15.png" width="50" align="left">
				<button type="button" class="btn btn-danger" onclick="location.href='overlapCheck.jsp'">Another ID</button>
			</div>
		<%}else{
			//존재하지 않는경우 %>
			<div style="margin: 10px 30px">
				<h5>▷<%=id %>◁ is available</h5>
				<img src="../image/05.png" width="50" align="left">
				<button type="button" class="btn btn-success" onclick="saveId('<%=id %>')">Apply and Close</button>
				<button type="button" class="btn btn-danger" onclick="location.href='overlapCheck.jsp'">Another ID</button>
			</div>
		<%}
	}
	%>
	<script>
		function saveId(id){
			//alert(id);
			//부모창:opener
			opener.$("#mfrm #mid").val(id);
			//opener.mid.value(id); //id에 id줄시에는 폼아이디 없이도 가능
			//opener.mfrm.mid.value=id; //form id가 있을시 id는 name도 가능
			//현재창닫기
			window.close();
		}
	</script>
</body>
</html>