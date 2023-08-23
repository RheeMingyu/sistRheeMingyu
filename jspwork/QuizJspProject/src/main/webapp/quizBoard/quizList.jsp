<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
	tr.detail{
		cursor: pointer;
	}
</style>
<body>
	<%
	QuizBoardDao dao=new QuizBoardDao();

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	int totalCount=dao.getTotalCount();
	int totalPage;
	int startPage;
	int endPage;
	int startNum;
	int perPage=5;
	int perBlock=3;
	int currentPage;
	int no;
	
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	startPage=(currentPage-1)/perBlock*perBlock+1;
	     
	endPage=startPage+perBlock-1;

	if(endPage>totalPage)
		endPage=totalPage;

	startNum=(currentPage-1)*perPage;

	no=totalCount-(currentPage-1)*perPage;

	List<QuizBoardDto> list=dao.getPagingData(startNum, perPage);
	%>
	<table class="table table-striped" style="width: 720px;margin: 50px">
		<caption align="top"><b style="margin: 50px">총 <%=totalCount %>개의 게시물이 있습니다</b>
		<button type="button" class="btn btn-outline-info btn-sm" style="float: right" onclick="location.href='quizImageList.jsp'"><i class="bi bi-image"></i></button>
		<button type="button" class="btn btn-outline-success btn-sm" style="float: right;margin-right: 5px" onclick="location.href='quizForm.jsp'"><i class="bi bi-pencil-square"></i></button></caption>
		<tr align="center">
			<th width="50">번호</th>
			<th width="150">작성자</th>
			<th width="280">제목</th>
			<th width="170">작성일</th>
			<th width="70">조회수</th>
		</tr>
		<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다</td>
			</tr>
		<%}else{
			for(int i=0;i<list.size();i++)
			{%>
				<tr class="detail">
					<td><%=no-- %><b style="visibility: hidden"><%=list.get(i).getQ_num() %></b></td>
					<td><%=list.get(i).getWriter() %></td>
					<td><%=list.get(i).getTitle() %><img src="../upload/<%=list.get(i).getImgname() %>" style="width:10px"></td>
					<td><%=sdf.format(list.get(i).getWriteday()) %></td>
					<td><%=list.get(i).getViewcount() %></td>
				</tr>
			<%}
		}%>
	</table>
	<div>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="quizList.jsp?currentPage=<%=(currentPage-1)==0?currentPage:(currentPage-1) %>">Previous</a>
		    </li>
		    <%
		    for(int pg=startPage;pg<=endPage;pg++)
		    {%>
		    	<li class="page-item"><a class="page-link" href="quizList.jsp?currentPage=<%=pg %>" <%=currentPage==pg?"style='background-color:aqua'":"" %>><%=pg %></a></li>
		    <%}
		    %>
		    <li class="page-item">
		      <a class="page-link" href="quizList.jsp?currentPage=<%=currentPage==totalPage?currentPage:(currentPage+1) %>">Next</a>
		    </li>
		  </ul>
		</nav>
	</div>
	<script>
		$("tr.detail").click(function(){
			var thisNum=$(this).find("b").text();
			location.href="detailForm.jsp?num="+thisNum;
		});
	</script>
</body>
</html>