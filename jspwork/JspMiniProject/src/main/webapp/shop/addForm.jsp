<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<div class="inputForm" style="width: 500px">
		<form action="shop/addAction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<caption align="top"><b>상품등록</b></caption>
				<tr>
					<td style="width: 150px" class="table-success"><b>카테고리</b><br></td>
					<td>
						<select class="form-control" name="category" required="required">
							<option value="무슨상품">무슨상품</option>
							<option value="할지">할지</option>
							<option value="모르겠다">모르겠다</option>
							<option value="랜덤박스">랜덤박스</option>
							<option value="판다">판다</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px" class="table-success"><b>상품명</b><br></td>
					<td>
						<input type="text" name="sangpum" class="form-control" required="required" style="width: 200px" placeholder="상품명">
					</td>
				</tr>
				<tr>
					<td style="width: 150px" class="table-success"><b>상품이미지</b><br></td>
					<td>
						<input type="file" name="photo" class="form-control" required="required" style="width: 400px">
					</td>
				</tr>
				<tr>
					<td style="width: 150px" class="table-success"><b>상품가격</b><br></td>
					<td>
						<input type="text" name="price" class="form-control" required="required" style="width: 200px" placeholder="상품가격">
					</td>
				</tr>
				<tr>
					<td style="width: 150px" class="table-success"><b>입고일</b><br></td>
					<td>
						<%
						//현재날짜 구하기
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						String day=sdf.format(new Date());
						%>
						<input type="date" name="ipgoday" class="form-control" required="required" style="width: 200px" value="<%=day%>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-success" style="width: 100px">저장</button>
						<button type="button" class="btn btn-outline-success" style="width: 100px" onclick="location.href='index.jsp?main=shop/shopList.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>