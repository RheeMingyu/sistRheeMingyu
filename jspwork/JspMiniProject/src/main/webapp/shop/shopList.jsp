<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	img.photo{
		width: 200px;
		height: 230px;
		border: 1px solid gray;
		border-radius: 20px;
		margin-bottom: 10px;
	}
	tr{
		padding: 10px;
	}
</style>
<body>
	<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllSangpums();
	%>
	
	<div class="container mt-3">
  <h2>Toggleable Tabs</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-1">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-2">무슨상품</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-3">할지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-4">모르겠다</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-5">랜덤박스</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-6">판다</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-1" class="container tab-pane fade"><br>
      <p>
      	<table class="table table-bordered" style="width: 700px">
      		<caption align="top"><b>전체상품목록</b></caption>
      		<tr>
      			<%
      			NumberFormat nf=NumberFormat.getCurrencyInstance();
      			int i=0;
      			for(ShopDto dto:list)
      			{
      				String photo=dto.getPhoto();
      				
      				//20~50%까지 랜덤 할인율
      				int dc=(int)(Math.random()*31)+20;
      				%>
      				<td><a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail"><img src="shopsave/<%=photo %>" class="photo"></a><br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;font-size: 1.2em"><%=dc %>%</b>
      				<span style="float: right">
      					<div style="color: gray;font-size: 13px">
      					<%
      					int price=(int)(dto.getPrice()-(dto.getPrice()*(dc/100.0)));
      					%>
      					<strike><%=nf.format(dto.getPrice()) %></strike>
      					<div style="color: black;font-size: 16px">
      						<%=nf.format(price) %>
      					</div>
      				</span>
      				</td>
      			<%if((i+1)%4==0)
      			{%>
      				</tr><tr>
      			<%}i++;
      			}%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-2" class="container tab-pane fade"><br>
      <p>
      	<table class="table table-bordered" style="width: 700px">
      		<caption align="top"><b>전체상품목록</b></caption>
      		<tr>
      			<%
      			i=0;
      			for(ShopDto dto:list)
      			{
      				if(dto.getCategory().equals("무슨상품")){
      				String photo=dto.getPhoto();
      				
      				//20~50%까지 랜덤 할인율
      				int dc=(int)(Math.random()*31)+20;
      				%>
      				<td><a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail"><img src="shopsave/<%=photo %>" class="photo"></a><br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;font-size: 1.2em"><%=dc %>%</b>
      				<span style="float: right">
      					<div style="color: gray;font-size: 13px">
      					<%
      					int price=(int)(dto.getPrice()-(dto.getPrice()*(dc/100.0)));
      					%>
      					<strike><%=nf.format(dto.getPrice()) %></strike>
      					<div style="color: black;font-size: 16px">
      						<%=nf.format(price) %>
      					</div>
      				</span>
      				</td>
      			<%if((i+1)%4==0)
      			{%>
      				</tr><tr>
      			<%}i++;
      			}}%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-3" class="container tab-pane fade"><br>
      <p>
      	<table class="table table-bordered" style="width: 700px">
      		<caption align="top"><b>전체상품목록</b></caption>
      		<tr>
      			<%
      			i=0;
      			for(ShopDto dto:list)
      			{
      				if(dto.getCategory().equals("할지")){
      				String photo=dto.getPhoto();
      				
      				//20~50%까지 랜덤 할인율
      				int dc=(int)(Math.random()*31)+20;
      				%>
      				<td><a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail"><img src="shopsave/<%=photo %>" class="photo"></a><br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;font-size: 1.2em"><%=dc %>%</b>
      				<span style="float: right">
      					<div style="color: gray;font-size: 13px">
      					<%
      					int price=(int)(dto.getPrice()-(dto.getPrice()*(dc/100.0)));
      					%>
      					<strike><%=nf.format(dto.getPrice()) %></strike>
      					<div style="color: black;font-size: 16px">
      						<%=nf.format(price) %>
      					</div>
      				</span>
      				</td>
      			<%if((i+1)%4==0)
      			{%>
      				</tr><tr>
      			<%}i++;
      			}}%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-4" class="container tab-pane fade"><br>
      <p>
      	<table class="table table-bordered" style="width: 700px">
      		<caption align="top"><b>전체상품목록</b></caption>
      		<tr>
      			<%
      			i=0;
      			for(ShopDto dto:list)
      			{
      				if(dto.getCategory().equals("모르겠다")){
      				String photo=dto.getPhoto();
      				
      				//20~50%까지 랜덤 할인율
      				int dc=(int)(Math.random()*31)+20;
      				%>
      				<td><a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail"><img src="shopsave/<%=photo %>" class="photo"></a><br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;font-size: 1.2em"><%=dc %>%</b>
      				<span style="float: right">
      					<div style="color: gray;font-size: 13px">
      					<%
      					int price=(int)(dto.getPrice()-(dto.getPrice()*(dc/100.0)));
      					%>
      					<strike><%=nf.format(dto.getPrice()) %></strike>
      					<div style="color: black;font-size: 16px">
      						<%=nf.format(price) %>
      					</div>
      				</span>
      				</td>
      			<%if((i+1)%4==0)
      			{%>
      				</tr><tr>
      			<%}i++;
      			}}%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-5" class="container tab-pane fade"><br>
      <p>
      	<table class="table table-bordered" style="width: 700px">
      		<caption align="top"><b>전체상품목록</b></caption>
      		<tr>
      			<%
      			i=0;
      			for(ShopDto dto:list)
      			{
      				if(dto.getCategory().equals("랜덤박스")){
      				String photo=dto.getPhoto();
      				
      				//20~50%까지 랜덤 할인율
      				int dc=(int)(Math.random()*31)+20;
      				%>
      				<td><a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail"><img src="shopsave/<%=photo %>" class="photo"></a><br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;font-size: 1.2em"><%=dc %>%</b>
      				<span style="float: right">
      					<div style="color: gray;font-size: 13px">
      					<%
      					int price=(int)(dto.getPrice()-(dto.getPrice()*(dc/100.0)));
      					%>
      					<strike><%=nf.format(dto.getPrice()) %></strike>
      					<div style="color: black;font-size: 16px">
      						<%=nf.format(price) %>
      					</div>
      				</span>
      				</td>
      			<%if((i+1)%4==0)
      			{%>
      				</tr><tr>
      			<%}i++;
      			}}%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-6" class="container tab-pane fade"><br>
      <p>
      	<table class="table table-bordered" style="width: 700px">
      		<caption align="top"><b>전체상품목록</b></caption>
      		<tr>
      			<%
      			i=0;
      			for(ShopDto dto:list)
      			{
      				if(dto.getCategory().equals("판다")){
      				String photo=dto.getPhoto();
      				
      				//20~50%까지 랜덤 할인율
      				int dc=(int)(Math.random()*31)+20;
      				%>
      				<td><a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail"><img src="shopsave/<%=photo %>" class="photo"></a><br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;font-size: 1.2em"><%=dc %>%</b>
      				<span style="float: right">
      					<div style="color: gray;font-size: 13px">
      					<%
      					int price=(int)(dto.getPrice()-(dto.getPrice()*(dc/100.0)));
      					%>
      					<strike><%=nf.format(dto.getPrice()) %></strike>
      					<div style="color: black;font-size: 16px">
      						<%=nf.format(price) %>
      					</div>
      				</span>
      				</td>
      			<%if((i+1)%4==0)
      			{%>
      				</tr><tr>
      			<%}i++;
      			}}%>
      		</tr>
      	</table>
      </p>
    </div>
  </div>
</div>

<script>
	$("a.goDetail").click(function(){
		var shopnum=$(this).attr("shopnum");
		//alert(shopnum);
		
		location.href="index.jsp?main=shop/detailPage.jsp?shopnum="+shopnum;
	});
</script>
</body>
</html>