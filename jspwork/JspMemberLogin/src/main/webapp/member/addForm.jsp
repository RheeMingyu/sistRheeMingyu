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
<script>
	$(function(){
		$("#btnSignUp").click(function(){
			if(mfrm.mid.value.length==0)
			{
				alert("Please Add ID Info");
				return false;
			}
		});
	});
</script>
<body>
	<div style="margin: 50px;">
		<form action="addProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 500px">
				<caption align="top" style="font-size: 1.5em"><b>Signing Up</b></caption>
				<tr>
					<th style="background-color: aliceblue; width: 120px">ID</th>
					<td>
						<input type="text" class="form-control" name="id" style="width: 100px"
						readonly="readonly" required="required" id="mid">
						<button type="button" class="btn btn-danger btn-sm"	onclick="openid()">Verifying ID</button>
					</td>
				</tr>
				<tr>
					<th style="background-color: aliceblue;width: 120px">Password</th>
					<td>
						<input type="password" class="form-control" name="pass" style="width: 120px" required="required">
					</td>
				</tr>
				<tr>
					<th style="background-color: aliceblue;width: 120px">Name</th>
					<td>
						<input type="text" class="form-control" name="name" style="width: 120px" required="required">
					</td>
				</tr>
				<tr>
					<th style="background-color: aliceblue;width: 120px">Image</th>
					<td>
						<input type="file" name="picture" style="width: 250px">
					</td>
				</tr>
				<tr>
					<th style="background-color: aliceblue;width: 120px">PhoneNo</th>
					<td>
						<input type="text" class="form-control" name="hp" style="width: 120px" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success" id="btnSignUp">Sign Up</button>
						<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">Members</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function openid(){
			window.open("overlapCheck.jsp","e","left=400px,top=100px,width=570px,height=250px");
		}
	</script>
</body>
</html>