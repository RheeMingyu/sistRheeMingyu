<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<fmt:requestEncoding value="utf-8"/>
	<form action="ex4_jstlTagTest.jsp" method="post">
		<table class="table table-bordered" style="width: 300px">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" style="width: 120px">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age" class="form-control" style="width: 120px">
				</td>
			</tr>
			<tr>
				<th>급여</th>
				<td>
					<input type="text" name="pay" class="form-control" style="width: 120px">
				</td>
			</tr>
			<tr>
				<th>가고싶은나라</th>
				<td>
					<input type="text" name="nara" class="form-control" style="width: 120px">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">결과확인</button>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 이름을 입력했을경우에만 출력 div출력 
	
		이름: 김영환
		나이: 19세(미성년자)..조건:20살 이상이면 성년 아니면 미성년
		월급여: 180만원 ..화폐단위와 천단위구분기호
		가고싶은나라: choose이용해서
	-->
	<c:if test="${!empty param.name }">
		<div class="alert alert-info" style="width: 600px">
			<h3>이름: ${param.name }</h3>
			<h3>나이: ${param.age }세(<c:choose><c:when test="${param.age<20 }">미성년자</c:when><c:otherwise>성년</c:otherwise></c:choose>)</h3>
			<h3>월급여: <fmt:formatNumber value="${param.pay }" type="currency"/></h3>
			<h3>가고싶은나라: ${param.nara }(은/는) <c:choose><c:when test="${param.nara=='소말리아' }">영환고향</c:when><c:when test="${param.nara=='나이지리아' }">영환주소</c:when><c:otherwise>사고</c:otherwise></c:choose> </h3>
		</div>
	</c:if>
</body>
</html>