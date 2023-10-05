<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
	i{
		cursor: pointer;
	}
	span.day{
		color: gray;
		font-size: 0.8em;
	}
	span.aday{
		color: gray;
		font-size: 0.8em;
		float: right;
	}
</style>
<script>
	$(function(){
		//시작할때
		list();
		
		//댓글부분 ajax insert
		var num=$("#num").val();
		//alert(num);
		
		$("#btnAdd").click(function(){
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname.trim().length==0)
			{
				swal ( "저런.." ,  "닉네임을 꼭 써주세요" ,  "error" );
				return;
			}
			if(content.trim().length==0)
			{
				swal ( "저런.." ,  "내용을 꼭 써주세요" ,  "error" );
				return;
			}
			
			$.ajax({
				type:"get",
				url:"board/insertAnswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(data){
					//기존입력값 지우기
					$("#nickname").val("");
					$("#content").val("");
					//리스트
					list();
				},
				statusCode:{
					404:function(){
						alert("json파일을 찾을 수 없어요");
					},
					500:function(){
						alert("서버오류..코드 다시 볼 것!");
					}
				}
			});
		});
		
		$(document).on("click","i.adel",function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			$.ajax({
				type:"post",
				url:"board/deleteAnswer.jsp",
				dataType:"html",
				data:{"idx":idx},
				success:function(data){
					//location.reload();
					list();
				}
			});
		});
	});
	
	function list(){
		//alert("list num="+$("#num").val());
		
		$.ajax({
			type:"get",
			url:"board/listAnswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(data){
				//댓글개수 출력
				$("b.acount>span").text(data.length);
				
				//출력
				var s="";
				$.each(data,function(idx,item){
					s+="<div>"+item.nickname+" : "+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>&nbsp;&nbsp;";
					s+="<i class='bi bi-pencil-square aedit'></i>&nbsp;";
					s+="<i class='bi bi-trash-fill adel' idx="+item.idx+"></i>";
					s+="</div>";
				});
				
				$("div.alist").html(s);
			}
		});
	}
</script>
<body>
	<%
	String num=request.getParameter("num");
	String currentPage=(request.getParameter("currentPage")==null?"1":request.getParameter("currentPage"));
	
	SmartDao dao=new SmartDao();
	SmartDto dto=dao.getSingleData(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
	<table class="talbe table-bordered">
		<input type="hidden" id="num" value="<%=num %>">
		<tr>
			<td>
				<div>
					<span style="font-size: 2.4em;"><b><%=dto.getSubject() %></b></span><br><br>
					<i class="bi bi-person-circle" style="font-size: 40px;float: left;margin-right: 10px"></i>
					<div><span style="color: gray"><%=dto.getWriter() %><br><%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;조회 <%=dto.getViewcount() %>
					&nbsp;&nbsp;&nbsp;<i class="bi bi-pencil-square"></i>&nbsp;<i class="bi bi-trash-fill" onclick="funcDel(<%=num%>,<%=currentPage%>)"></i>
					&nbsp;<i class="bi bi-arrow-clockwise" onclick="location.href='index.jsp?main=board/updateForm.jsp?num=<%=num%>&currentPage=<%=currentPage%>'"></i>
					&nbsp;<i class="bi bi-card-list" onclick="location.href='index.jsp?main=board/boardList.jsp?currentPage=<%=currentPage%>'"></i></span></div>
				</div>
				<hr>
				<div>
					<p><%=dto.getContent().replace("\n", "<br>") %></p>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<b class="acount" id="alist">댓글<span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<div class="aform input-group">
					<input type="text" id="nickname" class="form-control" style="width: 130px" placeholder="닉네임">
					<input type="text" id="content" class="form-control" style="width: 300px" placeholder="댓글">
					<button type="button" id="btnAdd" class="btn btn-outline-info">저장</button>
				</div>
			</td>
		</tr>
	</table>
	
	<script>
		function funcDel(num,currentPage){
			//alert(num+","+currentPage);
			if(confirm("정말 삭제하시겠습니까?"))
			{
				location.href="board/deleteAction.jsp?num="+num+"&currentPage="+currentPage;
			}
		}
	</script>
</body>
</html>