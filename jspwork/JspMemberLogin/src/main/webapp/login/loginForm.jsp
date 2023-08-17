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
<style>
	div{
		margin: 50px;
	}
	th{
		width: 75px;
	}
	input{
		margin-bottom: 9px;
	}
</style>
<%
String idsave=(String)session.getAttribute("save");
String id=(String)session.getAttribute("id");

boolean savechecked=true;

if(idsave==null)
{
	id="";
	savechecked=false;
}
%>
<body>
	<div>
		<form action="loginAction.jsp" method="post" class="form-inline">
			<table>
				<caption align="top"><b style="font-size: 1.5em">Sign In</b></caption>
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="id" style="width: 200px" class="form-control" placeholder="Add your ID" required="required" value="<%=id%>"><br>
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<input type="password" name="pass" style="width: 200px" class="form-control" placeholder="Add your password" required="required"><br>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="submit" class="btn btn-success" style="width: 200px">Sign In</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" onclick="location.href='../member/memberList.jsp'">Members</button><br>
						<label><input type="checkbox" name="savechk" <%=savechecked?"checked":"" %>> ID Fixed</label>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>