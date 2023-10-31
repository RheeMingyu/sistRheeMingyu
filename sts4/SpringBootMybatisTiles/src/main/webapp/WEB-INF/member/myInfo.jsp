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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="dto" items="${list }">
	<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
		<table class="table table-bordered">
			<tr>
				<td rowspan="5" align="center">
					<img src="../membersave/${dto.photo }"><br><br>
					<button type="button" class="btn btn-outline-secondary mod" num="${dto.num }">사진수정</button>
				</td>
				<th><b>이름</b></th>
				<td class="forname"><b>${dto.name }</b></td>
				<td rowspan="5" align="center" style="width: 70px" valign="middle">
					<button type="button" class="btn btn-outline-info dmod" num="${dto.num }">수정</button>
					<button type="button" class="btn btn-outline-danger del" num="${dto.num }">삭제</button>
				</td>
			</tr>
			<tr>
				<th><b>아이디</b></th>
				<td class="forid"><b>${dto.id }</b>
			</tr>
			<tr>
				<th><b>주소</b></th>
				<td class="foraddr"><b>${dto.addr }</b>
			</tr>
			<tr>
				<th><b>이메일</b></th>
				<td class="foremail"><b>${dto.email }</b>
			</tr>
			<tr>
				<th><b>가입일</b></th>
				<td><b>${dto.gaipday }</b>
			</tr>
		</table>
	</c:if>
	</c:forEach>
	<input type="file" style="display: none" id="newphoto" num="">
	
	<button type="button" style="display: none" data-bs-toggle="modal" data-bs-target="#modModal" id="btnmodal" num=""></button>
	<!-- The Modal -->
	<div class="modal" id="modModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">수정할 정보</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<select name="selup" id="selup">
	      		<option value="name">이름</option>
	      		<option value="addr">주소</option>
	      		<option value="email">이메일</option>
	      	</select>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-success" id="btnsel">확인</button>
	      	<button type="button" style="display: none" data-bs-dismiss="modal" id="close">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<script>
		$(".mod").click(function(){
			var num=$(this).attr("num");
			
			$("#newphoto").attr("num",num);
			$("#newphoto").trigger("click");
		});
		
		$("#newphoto").change(function(){
			var num=$(this).attr("num");
			
			const form=new FormData();
			form.append("photo",$(this)[0].files[0]); //선택한 한개만 추가
				//MultipartFile객체의 참조변수명..반드시 db컬럼명과 일치
			form.append("num",num);
			//console.dir(form);
			
			$.ajax({
				data:form,
				dataType:"html",
				type:"post",
				url:"updatephoto",
				//enctype: 'multipart/form-data',
				processData: false,
	            contentType: false,
				success:function(){
					//alert("사진변경 완료");
					location.reload();
				}
			});
		});
		
		$(".del").click(function(){
			var num=$(this).attr("num");
			
			if(confirm("정말 탈퇴하시겠습니까?")){
				$.ajax({
					data:{"num":num},
					dataType:"html",
					type:"get",
					url:"delete",
					success:function(){
						alert("탈퇴 완료");
						location.href="/";
					}
				});
			}
		});
		
		$(".dmod").click(function(){
			var num=$(this).attr("num");
			$("#btnmodal").attr("num",num);
			
			$("#btnmodal").trigger("click");
		});
		
		$("#btnsel").click(function(){
			var num=$("#btnmodal").attr("num");
			var selinfo=$("#selup").val();
			//alert(num+","+selinfo);
			
			$.ajax({
				data:{"num":num,"selinfo":selinfo},
				url:"/member/updatemodalform",
				dataType:"json",
				type:"get",
				success:function(res){
					//alert(selinfo);
					if(selinfo=="name"){
						$("td.forname").html("<input type='text' class='form-control' name='name' value='"+res.newinfo+"'>&nbsp;<button type='button' id='upclear' class='btn btn-warning' num='"+num+"' selinfo='"+selinfo+"'>수정완료</button>");
					}else if(selinfo=="addr"){
						$("td.foraddr").html("<input type='text' class='form-control' name='addr' value='"+res.newinfo+"'>&nbsp;<button type='button' id='upclear' class='btn btn-warning' num='"+num+"' selinfo='"+selinfo+"'>수정완료</button>");
					}else if(selinfo=="email"){
						$("td.foremail").html("<input type='text' class='form-control' name='email' value='"+res.newinfo+"'>&nbsp;<button type='button' id='upclear' class='btn btn-warning' num='"+num+"' selinfo='"+selinfo+"'>수정완료</button>")
					}
				}
			});
			$("#close").trigger("click");
		});
		
		$(document).on("click","#upclear",function(){
			var num=$(this).attr("num");
			var selinfo=$(this).attr("selinfo");
			var newinfo=$(this).prev().val();
			//alert(num+","+selinfo+","+newinfo);
			
			$.ajax({
				data:{"num":num,"selinfo":selinfo,"newinfo":newinfo},
				url:"/member/updatemodal",
				dataType:"html",
				type:"get",
				success:function(){		
					//alert(selinfo);
					if(selinfo=="name"){
						$("td.forname").html("<b>"+newinfo+"</b>");
					}else if(selinfo=="addr"){
						$("td.foraddr").html("<b>"+newinfo+"</b>");
					}else if(selinfo=="email"){
						$("td.foremail").html("<b>"+newinfo+"</b>");
					}
				}
			});
		});
	</script>
</body>
</html>