<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="model.intro.IntroDto"%>
<%@page import="model.intro.IntroDao"%>
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
<style>
	a{
		text-decoration: none;
	}
</style>
<%
IntroDao dao=new IntroDao();
Vector<IntroDto> list=dao.getAllDatas();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<button type="button" class="btn btn-success" onclick="location.href='addForm.jsp'">다시입력</button>
	<table class="table table-bordered" style="width: 900px">
		<tr>
			<th>번호</th><th>이름</th><th>혈액형</th><th>연락처</th><th>거주지</th><th>작성일</th><th>변동</th>
		</tr>
		<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="7" align="center">데이터가 없습니다</td>
			</tr>
		<%}
		else
		{
			for(int i=0;i<list.size();i++)
			{%>
				<tr>
					<td><%=i+1 %></td>
					<td><a onclick="location.href='detail.jsp?num=<%=list.get(i).getIntro_num() %>'"><%=list.get(i).getIntro_name() %></a></td>
					<td><%=list.get(i).getIntro_blood() %></td>
					<td><%=list.get(i).getIntro_hp() %></td>
					<td><%=list.get(i).getIntro_city() %></td>
					<td><%=sdf.format(list.get(i).getGaipday()) %></td>
					<td>
						<button type="button" class="btn btn-success"
						onclick="location.href='updateForm.jsp?num=<%=list.get(i).getIntro_num() %>'">수정</button>
						<button type="button" class="btn btn-danger"
						onclick="funcdel(<%=list.get(i).getIntro_num() %>)">삭제</button>
					</td>
				</tr>
			<%}
		}%>
	</table>
	<script>
		function funcdel(num){
			if(confirm("정말 삭제하시겠습니까?"))
			{
				alert("삭제되었습니다");
				location.href="deleteIntro.jsp?num="+num;
			}
			else
				alert("삭제가 취소되었습니다");
		}
	</script>
</body>
</html>