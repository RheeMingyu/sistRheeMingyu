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
	<c:if test="${mdto==0 }">
		<span><b>${totalcount}개의 영화 상영 중</b></span>
	</c:if>
	<table class="table table-dark" style="margin-top: 50px">
		<tr>
			<td>
				<div>
					<c:if test="${totalcount==0 }">
						<span><b>영화관이 망했습니다... 다른 영화관으로</b></span>
					</c:if>
					<c:if test="${totalcount!=0 }">
						<span><b>${totalcount}개의 영화 상영 중</b></span>
					</c:if>
					<span style="float: right">
						<button type="button" class="btn btn-outline-light btn-sm" onclick="location.href='writeform'">정보추가</button>
					</span>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
				<div>
					<c:forEach var="mdto" items="${mlist }">
						<div style="float: left;margin-right: 30px">
							<span>${mdto.mv_title }&nbsp;|&nbsp;${mdto.mv_director }</span><br>
							<c:if test="${mdto.mv_poster!='null' }">
								<div><a href="detail?num=${mdto.mv_num}"><img src="../moviephoto/${mdto.mv_poster}" width="110" height="140"></a></div>
							</c:if>
							<c:if test="${mdto.mv_poster=='null' }">
								<div><a href="detail?num=${mdto.mv_num}"><img src="../moviephoto/noposter.png" width="110" height="140"></a></div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>