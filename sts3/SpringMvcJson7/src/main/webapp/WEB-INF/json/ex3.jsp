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
	<h3>ex3</h3>
	<button type="button" id="btn3" class="btn btn-info">list1 json데이터 출력</button>
	<div id="out3"></div>
	
	<script>
		$("#btn3").click(function(){
			var s="";
			$.ajax({
				type:"get",
				dataType:"json",
				url:"list3",
				success:function(res){
					$.each(res, function(i,ele){
						s+="<figure>";
						s+="<img src='image/"+ele.photo+"' width=100>";
						s+="<figcaption><b>"+ele.name+"</b></figcaption>";
						s+="</figure>";
					});
					$("#out3").html(s);
				}
			});
		});
	</script>
</body>
</html>