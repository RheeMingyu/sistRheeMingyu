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
	<form action="quizAction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;margin: 50px">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" class="form-control" required="required" autofocus placeholder="작성자">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" class="form-control" required="required" placeholder="제목">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="center">
					<textarea style="width: 500px;height: 200px" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
					<input type="file" name="imgname">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info">제출</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='quizList.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>