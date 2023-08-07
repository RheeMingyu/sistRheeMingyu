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
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered" style="width: 500px">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" placeholder="이름" required="required">
				</td>
			</tr>
			<tr>
				<th>혈액형</th>
				<td>
					<select name="blood">
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="O">O</option>
						<option value="AB">AB</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<select name="hp1">
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="010">010</option>
					</select>
					-
					<input type="text" maxlength="4" name="hp2" required="required"
					style="width: 60px" id="hp2">
					-
					<input type="text" maxlength="4" name="hp3" required="required"
					style="width: 60px" id="hp3">
				</td>
			</tr>
			<tr>
				<th>거주도시</th>
				<td>
					<label><input type="radio" name="city" value="서울" checked>서울</label>
					<label><input type="radio" name="city" value="부산">부산</label>
					<label><input type="radio" name="city" value="경기">경기</label>
					<label><input type="radio" name="city" value="인천">인천</label>
					<label><input type="radio" name="city" value="제주">제주</label>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">제출</button>
					<button type="button" class="btn btn-success" onclick="location.href='list.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
	<script>
		$("#hp2").keyup(function(){
			if($(this).val().length>=$(this).attr("maxlength"))
				$("#hp3").focus();
		});
	</script>
</body>
</html>