<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
	img.large{
		width: 250px;
		height: 270px;
	}
</style>
<body>
	<%
	String shopnum=request.getParameter("shopnum");
	
	//로그인상태
	String loginOk=(String)session.getAttribute("loginOk");
	String myId=(String)session.getAttribute("myId");
	//아이디에 해당하는 멤버의 시퀀스
	MemberDao mdao=new MemberDao();
	String num=mdao.getNumFromId(myId);
	
	ShopDao dao=new ShopDao();
	ShopDto dto=dao.getSingleSangpum(shopnum);
	%>
	<form id="frm">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="shopnum" value="<%=shopnum %>">
		
		<table style="width: 800px">
			<tr>
				<td style="width: 500px">
					<div id="photo"><img src="shopsave/<%=dto.getPhoto()%>" class="img-thumbnail large"></div>
				</td>
				<td>
					<h3>카테고리: <%=dto.getCategory() %></h3>
					<h3>상품명: <%=dto.getSangpum() %></h3>
					<%
					NumberFormat nf=NumberFormat.getCurrencyInstance();
					%>
					<h3>가격: <%=nf.format(dto.getPrice()) %></h3>
					<h3>
						개수:
						<input type="number" min="1" max="10" value="1" step="1" name="cnt">
					</h3>
					<div style="margin-top: 60px;margin-left: 50px">
						<button type="button" class="btn btn-success" id="btncart">장바구니</button>
						<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=shop/shopList.jsp'">상품목록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<script>
	$("#btncart").click(function(){
		
		var loginOk="<%=loginOk%>";
		if(loginOk=="null"){
			alert("로그인을 먼저 해주세요");
			return;
		}
		
		//form태그의 모든값 가져오기
		var formData=$("#frm").serialize();
		//alert(formData);
		
		//ajax insert
		$.ajax({
			type:"post",
			dataType:"html",
			data:formData,
			url:"shop/detailCartInsertProc.jsp",
			success:function(data){
				//alert("성공");
				var a=confirm("장바구니에 저장하였습니다\n장바구니로 이동하려면 [확인]을 눌러주세요");
				if(a){
					location.href="index.jsp?main=shop/myCart.jsp";
				}
			}
		});
	});

</script>
</body>
</html>