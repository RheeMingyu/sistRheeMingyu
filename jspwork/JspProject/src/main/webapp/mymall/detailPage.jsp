<%@page import="java.text.NumberFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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
<body>
	<%
	String num=request.getParameter("no");
	
	MallDao dao=new MallDao();
	MallDto dto=dao.getData(num);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
 	%>
 	<table class="table table-bordered" style="width: 700px">
 		<tr align="center" valign="middle">
 			<td rowspan="3" align="center"><img src="<%=dto.getPhoto() %>" style="width: 300px">
 			<th>상품명</th>
 			<td><%=dto.getSangpum() %></td>
 		</tr>
 		<tr align="center" valign="middle">
 			<th>가격</th>
 			<td><%=nf.format(Integer.parseInt(dto.getPrice())) %></td>
 		</tr>
 		<tr align="center" valign="middle">
 			<th>입고일</th>
 			<td><%=dto.getIpgoday() %></td>
 		</tr>
 		<tr>
 			<td colspan="3" align="center">
				<button type="button" class="btn btn-success" onclick="history.back()">
				목록</button> <!-- history.back()은 바로 직전으로 되돌아가기 함수 -->
			</td>
 		</tr>
 	</table>
</body>
</html>