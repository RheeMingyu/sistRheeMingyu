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
<script>
	$(function(){
		//select된 선택값 얻기
		var srcImg=$("#photo").val();
		//selphoto에 넣기
		$("#selphoto").attr("src",srcImg);
		
		$("#photo").change(function(){
			$("#selphoto").attr("src",$(this).val());
		});
	});
</script>
</head>
<body>
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered" style="width: 300px">
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" name="sangpum" class="form-control" placeholder="상품명"
					required="required">
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<select name="photo" id="photo">
						<option value="../image/cartoon/acc01.png">시계</option>
						<option value="../image/cartoon/bag01.png">가죽백</option>
						<option value="../image/cartoon/bag02.png">회색백</option>
						<option value="../image/cartoon/bag03.png">체크백</option>
						<option value="../image/cartoon/bag04.png">빨간백</option>
						<option value="../image/cartoon/box.png">선물박스</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="price" class="form-control" placeholder="가격"
					required="required">
				</td>
			</tr>
			<tr>
				<th>입고일</th>
				<td>
					<input type="date" name="ipgoday" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success"
					onclick="location.href='list.jsp'">제출</button>
					<button type="button" class="btn btn-danger"
					onclick="location.href='list.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
	<div>
		<img src="" id="selphoto">
	</div>
</body>
</html>