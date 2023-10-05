<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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
	div.sangpum{
		cursor: pointer;
	}
	div.sangpum img{
		width: 60px;
		height: 70px;
		border: 1px solid gray;
	}
	i.bi-trash-fill{
		cursor: pointer;
	}
</style>
<body>
	<%
	//로그인 id
	String id=(String)session.getAttribute("myId");
	ShopDao dao=new ShopDao();
	
	MemberDao mdao=new MemberDao();
	String name=mdao.getNameFromId(id);
	
	//장바구니 목록
	List<HashMap<String,String>> list=dao.getCartList(id);
	
	int totalPrice=0;
	NumberFormat nf=NumberFormat.getCurrencyInstance();
	%>
	<h4 class="alert alert-info" style="width: 1000px"><%=name %> 님의 장바구니 목록</h4>
	<table class="table table-striped" style="width: 1000px">
		<tr>
			<th style="width: 30px"><input type="checkbox" id="allCheck"></th>
			<th style="width: 200px">상품정보</th><th style="width: 200px">상품금액</th>
		</tr>
		<%for(int i=0;i<list.size();i++){
		
			HashMap<String,String> map=list.get(i);
			
			//사진
			String photo=map.get("photo");%>
			<tr>
				<td><input type="checkbox" idx="<%=map.get("idx")%>" class="idx"></td>
				<td>
					<div class="sangpum" shopnum="<%=map.get("shopnum")%>">
						<img src="shopsave/<%=map.get("photo") %>" align="left" hspace="20px">
						<h5>상품명: <%=map.get("sangpum") %></h5>
						<h5>개수: <%=map.get("cnt") %></h5>
						<h5>날짜: <%=map.get("cartday") %></h5>
					</div>
				</td>
				<td>
					<h5><%=nf.format(Integer.parseInt(map.get("price"))*Integer.parseInt(map.get("cnt"))) %></h5>
					<i class="bi bi-trash-fill" idx="<%=map.get("idx")%>"></i>
				</td>
				<%totalPrice+=Integer.parseInt(map.get("price"))*Integer.parseInt(map.get("cnt")); %>
			</tr>
		<%}%>
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-danger" id="btnCartDel">선택상품삭제</button>&nbsp;
				<span style="float: right">총 주문금액: <b style="color: green"><%=nf.format(totalPrice) %></b></span>
			</td>
		</tr>
	</table>
	
	<script>
		//전체선택시 체크박스선택해제
		$("#allCheck").click(function(){
			var check=$(this).is(":checked");
			console.log(check);
			
			//전체 체크값을 글앞의 체크에 일괄전달
			$(".idx").prop("checked",check);
		});
		
		//상품클릭시 디테일로
		$("div.sangpum").click(function(){
			var shopnum=$(this).attr("shopnum");

			location.href="index.jsp?main=shop/detailPage.jsp?shopnum="+shopnum;
		});
	
		$("#btnCartDel").click(function(){
			//체크한 개수
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("먼저 삭제할 상품을 선택해주세요");
				return;
			}
		});
	</script>
</body>
</html>