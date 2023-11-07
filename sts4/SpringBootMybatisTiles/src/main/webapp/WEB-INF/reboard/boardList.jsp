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
	<!-- 검색창 -->
	<div class="searcharea" style="width: 100%;text-align: center">
		<form action="list">
			<div style="width: 450px;height: 40px" class="d-inline-flex">
				<select name="searchcolumn" class="form-select" style="width: 150px">
					<option value="subject">제목</option>
					<option value="id">아이디</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>&nbsp;&nbsp;
				<input type="text" name="searchword" class="form-control" style="width: 150px" placeholder="검색어">
				&nbsp;&nbsp;<button type="submit" class="btn btn-success">검색</button>
			</div>
		</form>
	</div>
	
	<div style="margin: 20px 100px">
		<h3 class="alert alert-info">총 ${totalcount }개의 글이 있습니다</h3>
		<button type="button" class="btn btn-info" onclick="location.href='form'">글쓰기</button>
		<button type="button" class="btn btn-info" onclick="location.href='list?searchcolumn=id&searchword=${sessionScope.myid}'">내가쓴글</button>
		<table class="table table-bordered">
			<tr>
				<th width="60">번호</th>
				<th width="260">제목</th>
				<th width="160">작성자</th>
				<th width="200">작성일</th>
				<th width="100">조회</th>
				<th width="100">추천</th>
			</tr>
			<c:if test="${totalcount==0 }">
				<tr><td colspan="6" align="center"><h5>등록된 게시글이 없습니다</h5></td></tr>
			</c:if>
			<c:if test="${totalcount>0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${printnum }</td>
						<c:set var="printnum" value="${printnum-1 }"/>
						<td>
							<!-- 답글일경우 level 1개당 2칸씩띄우기 -->
							<c:forEach begin="1" end="${dto.relevel }">&nbsp;&nbsp;</c:forEach>
							<!-- 답글일경우 답글 이미지 -->
							<c:if test="${dto.relevel>0 }">
								<img src="../image/re.png">
							</c:if>
							<a href="content?num=${dto.num}&currentPage=${currentPage}">${dto.subject }</a>
							<c:if test="${dto.photo!='' }">
								<i class="bi bi-images" style="color: gray"></i>
							</c:if>
						</td>
						<td>${dto.name }</td>
						<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></td>
						<td>${dto.viewcount }</td>
						<td>${dto.likes }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	<!-- 페이징 -->
	<c:if test="${totalcount>0 }">
		<div style="width: 800px;text-align: center">
			<ul class="pagination justify-content-center">
				<!-- 이전 -->
				<c:if test="${startpage>1 }">
					<li class="page-item"><a href="list?currentPage=${startpage-1 }">이전</a></li>
				</c:if>
				
				<c:forEach var="pp" begin="${startpage }" end="${endpage }">
					<c:if test="${pp==currentPage }">
						<li class="page-item active">
							<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
						</li>
					</c:if>
					<c:if test="${pp!=currentPage }">
						<li class="page-item">
							<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
						</li>
					</c:if>
				</c:forEach>
				
				<!-- 다음 -->
				<c:if test="${endpage<totalpage }">
					<li class="page-item"><a href="list?currentPage=${endpage+1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
	</div>
</body>
</html>