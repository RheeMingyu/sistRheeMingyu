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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 800px;height: 500px;background-color: black;margin: 50px 50px">
		<c:if test="${mdto.mv_poster!='null' }">
			<img src="../moviephoto/${mdto.mv_poster}" height="430px" style="float: left" hspace="20" vspace="20">
		</c:if>
		<c:if test="${mdto.mv_poster=='null' }">
			<img src="../moviephoto/noposter.png" width="300" height="430" style="float: left" hspace="20" vspace="20">
		</c:if>
		<span style="color: white">
			<br><h3><b>영화제목 : ${mdto.mv_title }</b></h3><br><br>
			<h5>예매율 : ${ranper } %</h5><br><br>
			<h4>감독 : ${mdto.mv_director }</h4>
			<h4>개봉 : ${mdto.mv_opendate }</h4><br>
			<h4>관람객 평점 : ${ranstar/2.0 }</h4>
			<div id="star" style="font-size: 2em">
				<c:if test="${ranstar%2==0 }">
					<c:forEach begin="1" end="${ranstar/2 }">
						<i class="bi bi-star-fill"></i>
					</c:forEach>
					<c:forEach begin="1" end="${5-ranstar/2 }">
						<i class="bi bi-star"></i>
					</c:forEach>
				</c:if>
				<c:if test="${ranstar%2!=0 }">
					<c:forEach begin="1" end="${ranstar/2 }">
						<i class="bi bi-star-fill"></i>
					</c:forEach>
					<i class="bi bi-star-half"></i>
					<c:forEach begin="1" end="${5-ranstar/2 }">
						<i class="bi bi-star"></i>
					</c:forEach>
				</c:if>
			</div><br><br>
			<button type="button" class="btn btn-outline-light" onclick="location.href='list'">목록</button>
			<button type="button" class="btn btn-outline-light" onclick="location.href='updateform?num=${mdto.mv_num}'">수정</button>
			<button type="button" class="btn btn-outline-light" onclick="location.href='delete?num=${mdto.mv_num}'">삭제</button>
		</span>
	</div>
</body>
</html>