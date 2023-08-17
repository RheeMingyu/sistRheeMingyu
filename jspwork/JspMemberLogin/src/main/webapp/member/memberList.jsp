<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	function funcdel(num){
		//alert(num);
		
		$("#btnmdel").attr("num",num);
		$("#myModal").modal();
	}
</script>
</head>
<%
MemberDao dao=new MemberDao();
ArrayList<MemberDto> list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

String id=request.getParameter("id");
String name=request.getParameter("name");
%>
<body>
	<table class="table table-bordered" style="width: 900px;text-align: center;margin: 50px">
		<caption align="top">
			<%
			if(id!=null){%>
				<b style="font-size: 1em">Online Status : ON / ID : <%=id %> / Name : <%=name %></b>
			<%}%>
		</caption>
		<tr>
			<th style="background-color: aqua">Order</th>
			<th style="background-color: aqua">ID</th>
			<th style="background-color: aqua">Name</th>
			<th style="background-color: aqua">Phone No</th>
			<th style="background-color: aqua">Sign Up Day</th>
			<th style="background-color: aqua">Editing Tool</th>
		</tr>
		<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="6" align="center"><b>There are No Members who Signed Up</b></td>
			</tr>
		<%}
		
		for(int i=0;i<list.size();i++)
		{%>
			<tr>
				<td valign="middle"><%=i+1 %></td>
				<td valign="middle"><%=list.get(i).getId() %></td>
				<td><%=list.get(i).getName() %><br><img src="<%=list.get(i).getImage() %>" style="width:50px;border-radius:100px"></td>
				<td valign="middle"><%=list.get(i).getHp() %></td>
				<td valign="middle"><%=sdf.format(list.get(i).getGaip()) %></td>
				<%
				String loginstatus=(String)session.getAttribute("loginstatus");
				String lid=(String)session.getAttribute("id");
				
				//로그인한 본인꺼만 나오도록
				if(loginstatus!=null&&list.get(i).getId().equals(lid))
				{%>
					<td align="center" valign="middle">
						<button type="button" class="btn btn-success btn-sm" onclick="location.href='updateForm.jsp?num=<%=list.get(i).getNum() %>&picture=<%=list.get(i).getImage() %>'">Modify</button>
						<button type="button" class="btn btn-danger btn-sm" onclick="funcdel(<%=list.get(i).getNum() %>)">Delete</button>
					</td>
				<%}else{ %>
					<td valign="middle">
						UnQualified
					</td>
				<%} %>
			</tr>
		<%}
		%>
		<tr>
			<td colspan="6" align="right" style="background-color: aliceblue">
				<%
				if(id!=null){%>
					<button type="button" class="btn btn-success btn-sm" onclick="location.href='addForm.jsp'">Sign Up</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="location.href='../login/logoutForm.jsp'">Sign Out</button>&nbsp;
				<%}else{%>
					<button type="button" class="btn btn-success btn-sm" onclick="location.href='addForm.jsp'">Sign Up</button>&nbsp;
					<button type="button" class="btn btn-warning btn-sm" onclick="location.href='../login/loginForm.jsp'">Sign In</button>
				<%} %>
			</td>
		</tr>
	</table>
	
	<div class="container">
	
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Secession</h4>
	        </div>
	        <div class="modal-body">
	          <p>If you want to Withdraw, Push the [Secession] button</p>
	          <button type="button" class="btn btn-danger" id="btnmdel" num="">Secession</button>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	  
	</div>
	
	<script>
		$("#btnmdel").click(function(){
			var num=$(this).attr("num");
			location.href="../member/deleteMember.jsp?num="+num;
		});
	</script>
</body>
</html>