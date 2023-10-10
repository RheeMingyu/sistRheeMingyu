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
<style>
	th{
		width: 100px;
		text-align: center;
	}
	td{
		width: 150px;
	}
	#box{
		margin: 80px;
	}
</style>
</head>
<script>
	function formmod(selstr){
		if(selstr=="movie"){
			$("form").attr({
				action:"ilike/movie",
				method:"get"
			});
			$("#tr1 input").attr("name","title");
			$("#tr1").siblings().hide();
			$("#trb").show();
			$("#tr1>th").text("영화제목");
		}
		else if(selstr=="school"){
			$("form").attr({
				action:"school/myinfo",
				method:"get"
			});
			$("#tr1 input").attr("name","stname");
			$("#tr2 input").attr("name","stschool");
			$("#tr3 input").attr("name","grade");
			$("#tr4 input").attr("name","addr");
			$("tr").show();
			$("#tr1>th").text("이름");
			$("#tr2>th").text("학교");
			$("#tr3>th").text("학년");
			$("#tr4>th").text("주소");
		}
		else if(selstr=="shopping"){
			$("form").attr({
				action:"shop/ipgo",
				method:"post"
			});
			$("#tr1 input").attr("name","sang");
			$("#tr2 input").attr("name","cat");
			$("#tr3 input").attr("name","color");
			$("#tr4 input").attr("name","price");
			$("tr").show();
			$("#tr1>th").text("상품명");
			$("#tr2>th").text("카테고리");
			$("#tr3>th").text("색상");
			$("#tr4>th").text("가격");
		}
		else if(selstr=="health"){
			$("form").attr({
				action:"myshinsang",
				method:"post"
			});
			$("#tr1 input").attr("name","myname");
			$("#tr2 input").attr("name","age");
			$("#tr3 input").attr("name","bldtype");
			$("#tr4 input").attr("name","addr");
			$("tr").show();
			$("#tr1>th").text("이름");
			$("#tr2>th").text("나이");
			$("#tr3>th").text("혈액형");
			$("#tr4>th").text("주소");
		}
	}
</script>
<body>
	<div id="box">
	<select id="sel" style="margin-bottom: 10px">
		<option value="movie">영화</option>
		<option value="school">학생</option>
		<option value="shopping">상품</option>
		<option value="health">신상</option>
	</select>
	<form action="" method="">
		<table class="table table-bordered" style="width: 350px;">
			<tr id="tr1">
				<th>1</th><td><input type="text" name="" class="form-control" style="width: 250px"></td>
			</tr>
			<tr id="tr2">
				<th>2</th><td><input type="text" name="" class="form-control" style="width: 250px"></td>
			</tr>
			<tr id="tr3">
				<th>3</th><td><input type="text" name="" class="form-control" style="width: 250px"></td>
			</tr>
			<tr id="tr4">
				<th>4</th><td><input type="text" name="" class="form-control" style="width: 250px"></td>
			</tr>
			<tr id="trb">
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-dark" style="width: 70px">전송</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<br>
	<button id="b1" onclick="location.href='ilike/movie'" class="btn btn-outline-info">제목을 메시지로 받아서 출력하고 그아래 이미지_result1</button>
	<button id="b2" onclick="location.href='school/myinfo'" class="btn btn-outline-success">get방식 테이블출력(이름,학교,학년,주소)_result2</button>
	<button id="b3" onclick="location.href='shop/ipgo'" class="btn btn-outline-danger">post방식_dto_테이블출력(상품명,카테고리,색상,가격)_result3</button>
	<button id="b4" onclick="location.href='myshinsang'" class="btn btn-outline-warning">post방식 Map출력(이름,나이,혈액형,주소)_result4</button>
	
	<script>
	$("form").hide();
	$("#b1").hide();
	$("#b2").hide();
	$("#b3").hide();
	$("#b4").hide();

	$("#sel").on("change",function(){
		$("input").val("");
		var opsel=$(this).val();
		formmod(opsel);
		$("form").show();
		//alert($("#tr2 input").attr("name"));
	});
	</script>
</body>
</html>