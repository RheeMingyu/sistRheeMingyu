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
<style>
	i.amod,i.adel{
		font-size: 0.7em;
		color: gray;
		cursor: pointer;
	}
	#modacontent{
		width: 420px;
	}
</style>
<script>
	$(function(){
		list();
		
		$("#btnasnweradd").on("click",function(){
			var num=$("#num").val();
			var content=$("#content").val();
			
			if(content==""){
				alert("댓글을 입력해주세요");
				return;
			}else{
				$.ajax({
					data:{"num":num,"content":content},
					dataType:"html",
					type:"post",
					url:"/mbanswer/ainsert",
					success:function(res){
						$("#content").val("");
						list();
					}
				});
			}
		});
		
		$(document).on("click","i.amod",function(){
			var content=$(this).prev().text();
			var idx=$(this).attr("idx");
			var check=$(this).prev().attr("check");
			
			if(check=="check"){
				$(this).prev().remove();
				$(this).hide();
				$(this).next().hide();
				
				$("#content").hide();
				$("#btnasnweradd").hide();
				
				var s="";
				s+="<div class='d-inline-flex' style='height:40px'>";
				s+="<span style='width:80px;font-size:30px'>댓글 수정</span>";
				s+="<input type='text' id='modacontent' class='form-control' value='"+content+"' autofocus='autofocus'>&nbsp;";
				s+="<button type='button' class='btn btn-outline-warning' id='modclear' idx='"+idx+"'>수정완료</button>";
				s+="</div>";
				
				$(this).before(s);
			}
		});
		
		$(document).on("click","#modclear",function(){
			var idx=$(this).attr("idx");
			var content=$(this).prev().val();
			
			$.ajax({
				data:{"idx":idx,"content":content},
				dataType:"html",
				type:"post",
				url:"/mbanswer/aupdate",
				success:function(res){
					list();
					$("#content").show();
					$("#btnasnweradd").show();
				}
			});
		});
		
		$(document).on("click","i.adel",function(){
			var idx=$(this).attr("idx");
			
			$.ajax({
				data:{"idx":idx},
				dataType:"html",
				type:"post",
				url:"/mbanswer/adelete",
				success:function(res){
					list();
				}
			});
		});
	});
	
	function list(){
		var s="";
		num=$("#num").val();
		var loginok="${sessionScope.loginok}";
		var myid="${sessionScope.myid}";
		
		$.ajax({
			data:{"num":num},
			dataType:"json",
			type:"get",
			url:"/mbanswer/alist",
			success:function(res){
				$.each(res,function(i,e){
					s+="<b>"+e.name+"("+e.myid+") : </b>";
					s+="<span check='check'>"+e.content+"</span>&nbsp;&nbsp;";
					if(loginok!=null&&myid==e.myid){
						s+="<i class='bi bi-recycle amod' idx='"+e.idx+"'></i>&nbsp;";
						s+="<i class='bi bi-trash-fill adel' idx='"+e.idx+"'></i><br>";
					}else{
						s+="<br>";
					}
				});
				$("div.alist").html(s);
				$("span.acount").text(res.length);
			}
		});
	}
</script>
<body>
	<div style="margin: 50px 150px">
		<table class="table table-bordered" style="width: 600px">
			<tr>
				<td>
					<h4>
						<b>${dto.subject }</b>
						<span style="font-size: 12pt;color: gray;float: right">
							<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</h4>
					<span>작성자: ${dto.name } (${dto.myid })</span>
					<c:if test="${dto.uploadfile!='no' }">
						<span style="float: right"><a href="download?clip=${dto.uploadfile }">
							<i class="bi bi-arrow-down-circle"></i>&nbsp;<b>${dto.uploadfile }</b></a>
						</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test="${bupload}">
						<img src="../savefile/${dto.uploadfile }" style="width: 200px"><br>
					</c:if>
					<pre>${dto.content }</pre>
					<b>조회수: ${dto.viewcount }</b>&nbsp;&nbsp;&nbsp;
					<b>댓글:<span class="acount"></span></b>
				</td>
			</tr>
			
			<!-- 댓글 -->
			<tr>
				<td>
					<div class="alist"></div>
					<input type="hidden" id="num" value="${dto.num }">
					<c:if test="${sessionScope.loginok!=null }">
						<div class="aform">
							<div class="d-inline-flex" style="height: 40px">
								<input type="text" class="form-control" style="width: 500px" placeholder="댓글" id="content">&nbsp;&nbsp;
								<button type="button" class="btn btn-outline-secondary" id="btnasnweradd">등록</button>
							</div>
						</div>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-outline-success" onclick="loaction.href='form'">글쓰기</button>
					</c:if>
					<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
						<button type="button" class="btn btn-outline-info" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
					</c:if>
					<button type="button" class="btn btn-outline-light" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>