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
	<div style="margin: 100px 100px">
		<table class="table table-bordered" style="width: 600px">
			<caption align="top"><b>내용보기</b></caption>
			<tr>
				<td>
					<h2><b>${dto.subject }</b></h2>
					<span style="float: right;margin-right: 20px">
						조회: ${dto.viewcount }&nbsp;&nbsp;&nbsp;
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</span><br>
					<h5><b>작성자: ${dto.writer }</b></h5>
				</td>
			</tr>
			<tr>
				<td>
					<pre>${dto.content }</pre><br>
					<!-- 이미지가 있을때만 출력 -->
					<c:if test="${dto.photo!='no' }">
						<c:forTokens var="p" items="${dto.photo }" delims=",">
							<a href="../upload/${p }"><img src="../upload/${p }" style="width: 150px;height: 150px"></a>
						</c:forTokens>
					</c:if>
				</td>
			</tr>
			
			<!-- 댓글 -->
			<tr>
				<td>
					<div id="answer">
						<b>댓글: ${acount }</b><br>
						<c:forEach var="a" items="${alist }">
							${a.nickname }: ${a.content }&nbsp;&nbsp;
							<span>
								<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;
								<i class="bi bi-trash3-fill" style="cursor: pointer" idx="${a.idx }" num="${dto.num }"></i><br>
							</span>
						</c:forEach>
					</div>
					<form action="ainsert" method="post" style="width: 600px">
						<!-- hidden -->
						<input type="hidden" name="num" value="${dto.num }">
						<input type="hidden" name="currentPage" value="${currentPage }">
						<div class="d-inline-flex">
							<b>닉네임:</b>&nbsp;
							<input type="text" name="nickname" class="form-control" style="width: 100px" required="required">&nbsp;&nbsp;
							<b>비밀번호:</b>&nbsp;
							<input type="password" name="pass" class="form-control" style="width: 100px" required="required">
						</div>
						<br>
						<div class="d-inline-flex">
							<input type="text" name="content" class="form-control" style="width: 500px" required="required" placeholder="댓글내용을 입력해주세요">&nbsp;&nbsp;
							<button type="submit" class="btn btn-outline-info">확인</button>
						</div>
					</form>
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-success" onclick="location.href='writeForm'">글쓰기</button>
					<button type="button" class="btn btn-outline-info" onclick="location.href='writeForm?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
					<button type="button" class="btn btn-outline-warning" onclick="location.href='updatePassForm?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='deletePassForm?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
		$("i").on("click",function(){
			var idx=$(this).attr("idx");
			var num=$(this).attr("num");
			
			var pass=prompt("비밀번호를 입력해주세요");
			
			if(pass==null)
				return;
			else if(pass==""){
				alert("비밀번호를 입력해주세요");
				return;
			}
			
			$.ajax({
				data:{"idx":idx,"pass":pass,"num":num},
				type:"get",
				dataType:"json",
				url:"delete",
				success:function(res){
					
					if(res.no==1){
						alert("삭제 완료");
						location.reload();
					}
					else{alert("비밀번호가 틀렸습니다");}
				}
			});
		});
	</script>
</body>
</html>