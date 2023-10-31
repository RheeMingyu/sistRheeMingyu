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
	<marquee class="alert alert-info">
		총 ${totalcount }명의 회원이 함께합니다
	</marquee><br>
	<button type="button" class="btn btn-outline-info" onclick="location.href='form'">회원가입</button>
	<input type="checkbox" id="allcheck">
	<c:forEach var="dto" items="${list }">
		<table class="table table-bordered">
			<tr>
				<td rowspan="5" align="center">
					<img src="../membersave/${dto.photo }"><br><br>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='#'">사진수정</button>
				</td>
				<th><b>이름</b></th>
				<td><b>${dto.name }</b></td>
				<td rowspan="5" align="center" style="width: 70px" valign="middle">
					<button type="button" class="btn btn-outline-danger" onclick="location.href='deleteform?num=${dto.num}'">강퇴</button>
					<input type="checkbox" num="${dto.num }" class="del">
				</td>
			</tr>
			<tr>
				<th><b>아이디</b></th>
				<td><b>${dto.id }</b>
			</tr>
			<tr>
				<th><b>주소</b></th>
				<td><b>${dto.addr }</b>
			</tr>
			<tr>
				<th><b>이메일</b></th>
				<td><b>${dto.email }</b>
			</tr>
			<tr>
				<th><b>가입일</b></th>
				<td><b><fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/></b>
			</tr>
		</table>
	</c:forEach>
	<button type="button" class="btn btn-danger" id="btnmemberdel" num="">선택강퇴</button>
	
	<script>
		$("#allcheck").click(function(){
			var check=$(this).is(":checked");
			alert(check);
			
			$(".del").prop("checked",check);
		});
	
		/* $("input.del").click(function(){
			var num=$(this).attr("num");
			alert(num);
			
			var fin=$("#btnmemberdel").attr("num");
			fin+=num+",";
			
			$("#btnmemberdel").attr("num",fin);
		}); */
		
		$("#btnmemberdel").click(function(){
			//var num=$(this).attr("num");
			
			var cnt=$(".del:checked").length;
			
			if(cnt==0){
				alert("먼저 선택해주세요");
				return false;
			}
			$(".del:checked").each(function(i,ele){
				var num=$(this).attr("num");
				
				$.ajax({
					data:{"num":num},
					dataType:"html",
					type:"get",
					url:"delete",
					success:function(){
						alert("삭제 완료");
						location.reload();
					}
				});
			});
			//location.href="delete?num="+num;
		});
	</script>
</body>
</html>