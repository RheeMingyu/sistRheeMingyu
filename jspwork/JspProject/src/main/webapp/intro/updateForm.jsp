<%@page import="java.util.Vector"%>
<%@page import="model.intro.IntroDao"%>
<%@page import="model.intro.IntroDto"%>
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
String num=request.getParameter("num");

IntroDao dao=new IntroDao();
IntroDto dto=dao.getData(num);
String [] hpArr=dto.getIntro_hp().split("-");
%>
<body>
	<form action="updateAction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
		<table class="table table-bordered" style="width: 500px">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" required="required"
					value="<%=dto.getIntro_name() %>">
				</td>
			</tr>
			<tr>
				<th>혈액형</th>
				<td>
					<select name="blood">
						<option value="A" <%=dto.getIntro_blood().equals("A")?"selected":"" %>>A</option>
						<option value="B" <%=dto.getIntro_blood().equals("B")?"selected":"" %>>B</option>
						<option value="O" <%=dto.getIntro_blood().equals("O")?"selected":"" %>>O</option>
						<option value="AB" <%=dto.getIntro_blood().equals("AB")?"selected":"" %>>AB</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<select name="hp1">
						<option value="02"
						<%=hpArr[0].equals("02")?"selected":"" %>>02</option>
						<option value="031"
						<%=hpArr[0].equals("031")?"selected":"" %>>031</option>
						<option value="010"
						<%=hpArr[0].equals("010")?"selected":"" %>>010</option>
					</select>
					-
					<input type="text" maxlength="4" name="hp2" required="required"
					style="width: 60px" id="hp2" value="<%=hpArr[1] %>">
					-
					<input type="text" maxlength="4" name="hp3" required="required"
					style="width: 60px" id="hp3" value="<%=hpArr[2] %>">
				</td>
			</tr>
			<tr>
				<th>거주도시</th>
				<td>
					<label><input type="radio" name="city" value="서울"
					<%=dto.getIntro_city().equals("서울")?"checked":"" %>>서울</label>
					<label><input type="radio" name="city" value="부산"
					<%=dto.getIntro_city().equals("부산")?"checked":"" %>>부산</label>
					<label><input type="radio" name="city" value="경기"
					<%=dto.getIntro_city().equals("경기")?"checked":"" %>>경기</label>
					<label><input type="radio" name="city" value="인천"
					<%=dto.getIntro_city().equals("인천")?"checked":"" %>>인천</label>
					<label><input type="radio" name="city" value="제주"
					<%=dto.getIntro_city().equals("제주")?"checked":"" %>>제주</label>
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