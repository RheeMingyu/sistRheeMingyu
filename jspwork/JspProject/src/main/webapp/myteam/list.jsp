<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.myteam.TeamDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.myteam.TeamDao"%>
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
	<%
	TeamDao dao=new TeamDao();
	ArrayList<TeamDto> list=dao.getAllMyTeams();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
</head>
<body>
	<a href="addForm.jsp">팀원추가</a>
	<br>
	<table class="table table-bordered" style="width: 700px">
		<tr>
			<th>번호</th><th>이름</th><th>운전면허</th><th>주소</th><th>작성일</th><th>수정및삭제</th>
		</tr>
		<%
		for(int i=0;i<list.size();i++)
		{%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=list.get(i).getName() %></td> <!-- list.get(i)의 반환값이 TeamDto -->
				<td><%=list.get(i).getDriver() %></td>
				<td><%=list.get(i).getAddr() %></td>
				<td><%=sdf.format(list.get(i).getWriteday()) %></td>
				<td>
					<button type="button" class="btn btn-success"
					onclick="location.href='updateForm.jsp?num=<%=list.get(i).getNum()%>'">수정</button>
					<button type="button" class="btn btn-danger"
					onclick="ocd(<%=list.get(i).getNum()%>)">삭제</button>
				</td>
			</tr>
		<%}
		%>
	</table>
	<script>
	function ocd(num)
	{
		if(confirm("정말 삭제하겠습니까?"))
		{
			alert("삭제되었습니다");
			location.href='teamDelete.jsp?num='+num;
		}
		else
			alert("삭제가 취소되었습니다");
	}
	</script>
</body>
</html>