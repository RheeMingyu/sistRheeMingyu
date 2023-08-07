<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="model.mymall.MallDao"%>
<%@page import="model.mymall.MallDto"%>
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
<%
MallDao dao=new MallDao();
Vector<MallDto> list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
	<button type="button" onclick="location.href='addForm.jsp'" class="btn btn-success">다시추가</button>
	<table class="table table-bordered">
		<tr align="center">
			<th>번호</th><th>상품명</th><th>사진</th><th>가격</th><th>입고일</th><th>작성일</th><th>변동</th>
		</tr>
		<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="7" align="center">
					<h4>등록된 상품이 없습니다</h4>
				</td>
			</tr>
		<%}
		else
		{
			for(int i=0;i<list.size();i++)
			{%>
				<tr align="center" valign="middle">
					<td><%=i+1 %></td>
					<td><%=list.get(i).getSangpum() %></td>
					<td>
						<img src='<%=list.get(i).getPhoto() %>' width="50"
						onclick="location.href='detailPage.jsp?no=<%=list.get(i).getNo() %>'">
					</td>
					<td><%=nf.format(Integer.parseInt(list.get(i).getPrice())) %></td>
					<td><%=list.get(i).getIpgoday() %></td>
					<td><%=sdf.format(list.get(i).getWriteday()) %></td>
					<td>
						<button type="button" class="btn btn-success"
						onclick="location.href='updateForm.jsp?no=<%=list.get(i).getNo() %>'">수정</button>
						<button type="button" class="btn btn-danger"
						onclick="funcdel(<%=list.get(i).getNo() %>)">삭제</button>
					</td>
				</tr>
			<%}
		}
		%>
	</table>
	<script>
		function funcdel(num){
			if(confirm("정말 삭제하시겠습니까?"))
			{
				alert("삭제되었습니다");
				location.href="deleteMall.jsp?no="+num;
			}
			else
			{
				alert("삭제 취소되었습니다");	
			}
		}
	</script>
</body>
</html>