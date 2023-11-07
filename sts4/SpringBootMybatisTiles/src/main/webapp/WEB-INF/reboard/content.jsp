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
	<div style="width: 600px;margin: 50px 100px">
		<table class="table talbe-bordered">
			<tr>
				<td>
					<h2>${dto.subject }</h2>
					<b>${dto.name }(${dto.id })</b>
					<span style="color: gray;font-size: 0.8em">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<pre>${dto.content }</pre><br>
					<c:if test="${dto.photo!='' }">
						<c:forEach var="photo" items="${dto.photo }">
							<img src="../rephoto/${dto.photo }" width="100" class="img-thumbnail">
						</c:forEach>
					</c:if><br>
					<div class="likes">
						<i class="bi bi-hand-thumbs-up" style="cursor: pointer" num=${dto.num }></i>&nbsp;&nbsp;좋아요 <b>${dto.likes }</b>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-outline-info"
						onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
					</c:if>
					<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
						<button type="button" class="btn btn-outline-info"
						onclick="location.href=''">수정</button>
						<button type="button" class="btn btn-outline-info"
						onclick="location.href=''">삭제</button>
					</c:if>
					<button type="button" class="btn btn-outline-info"
					onclick="location.href='list?currentPage=${currentPage}'">목록</button>
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-outline-info"
						onclick="location.href=''">글쓰기</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
		$("div.likes>i").on("click",function(){
			var thumb=$(this).attr("class");
			if(thumb=='bi bi-hand-thumbs-up'){
				$(this).attr("class","bi bi-hand-thumbs-up col").css("color","red");
			}else{
				$(this).attr("class","bi bi-hand-thumbs-up").css("color","black");
			}
			
			var num=$(this).attr("num");
			$.ajax({
				data:{"num":num},
				dataType:"json",
				type:"get",
				url:"/reboard/likes",
				success:function(res){
					$("div.likes>b").text(res.likes);
				}
			});
		});
	</script>
</body>
</html>