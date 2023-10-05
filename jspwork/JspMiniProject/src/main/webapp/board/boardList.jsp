<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
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
	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
		cursor: pointer;
		text-decoration: underline;
	}
	i{
		cursor: pointer;
	}
</style>
<script>
	$(function(){
		$(".alldelcheck").click(function(){
			//전체 체크값 얻기
			var check=$(this).is(":checked");
			//console.log(check);
			
			//전체체크값을 글앞의 체크에 일괄 전달하기
			$(".delcheck").prop("checked",check);
		});
		
		$("#btnDel").click(function(){
			//체크된 길이
			var len=$(".delcheck:checked").length;
			//alert(len);
			
			if(len==0)
				alert("최소 한 개 이상 클릭해주세요");
			else
			{
				if(confirm(len+"개의 글을 삭제하시겠습니까?"))
				{	
					//체크된 곳의 value값 얻기
					var n="";
					$(".delcheck:checked").each(function(idx){
						n+=$(this).val()+",";
					});
					
					//마지막 컴마 제거하기
					n=n.substring(0,n.length-1);
					
					//console.log(n);
					location.href="board/allDelete.jsp?nums="+n;
				}
			}
		});
	});
</script>
<body>
	<%
	SmartDao dao=new SmartDao();
	
	int totalCount=dao.getTotalCount(); //전체개수
	int totalPage; //총 페이지수
	int startPage; //각블럭에서 보여질 시작페이지
	int endPage; //각블럭에서 보여질 끝페이지
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
	int perPage=3; //한페이지당 보여질 글의 개수
	int perBlock=5; //한블럭당 보여질 페이지 개수
	int currentPage; //현재페이지
	
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
	
	List<SmartDto> list=dao.getPagingList(startNum, perPage);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//댓글dao
	SmartAnswerDao adao=new SmartAnswerDao();
	for(SmartDto dto:list)
	{
		//댓글변수에 댓글총개수 넣기
		int acount=adao.getAllSmartAnswers(dto.getNum()).size();
		dto.setAnswercount(acount);
	}
	%>
	<table class="table table-striped" style="width: 750px">
		<b style="font-size: 2em">전체글보기</b><br>
		<caption align="top"><b><%=dao.getTotalCount() %>개의 게시글</b></caption>
		<tr align="center">
			<th width="50">번호</th><th width="400">제목</th><th width="110">작성자</th><th width="140">작성일</th><th width="50">조회</th>
		</tr>
		<%
		if(totalCount==0)
		{%>
			<tr align="center">
				<td colspan="5">게시글이 없습니다</td>
			</tr>
		<%}else{
			for(int i=0;i<list.size();i++)
			{%>
				<tr>
					<td align="center"><input type="checkbox" class="delcheck" value="<%=list.get(i).getNum()%>"> <%=list.size()-i %></td>
					<td class="sj"><a href="index.jsp?main=board/contentView.jsp?num=<%=list.get(i).getNum()%>&currentPage=<%=currentPage%>"><%=list.get(i).getSubject() %></a>
					<a href="index.jsp?main=board/contentView.jsp?num=<%=list.get(i).getNum()%>&currentPage=<%=currentPage%>#alist"><%=list.get(i).getAnswercount()>0?"["+list.get(i).getAnswercount()+"]":"" %></a></td>
					<td><%=list.get(i).getWriter() %></td>
					<td align="center"><%=sdf.format(list.get(i).getWriteday()) %></td>
					<td align="center"><%=list.get(i).getViewcount() %></td>
				</tr>
			<%}
		}%>
		<tr>
			<td colspan="5">
				<input type="checkbox" class="alldelcheck">전체선택
				<span style="float: right">
					<i class="bi bi-pencil-square" style="float: right" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</i>
					&nbsp;<i class="bi bi-trash-fill" onclick="" id="btnDel">삭제</i>
				</span>
			</td>
		</tr>
	</table>
	
	<div style="width: 600px;text-align: center">
			<ul class="pagination justify-content-center">
				<%
				if(startPage>1)
				{%>
					<li>
						<a href="index.jsp?main=board/boardList.jsp?currentPage=<%=startPage-1%>" class="page-link">이전</a>
					</li>
				<%}			
				for(int pp=startPage;pp<=endPage;pp++)
				{
					if(pp==currentPage)
					{%>
						<li class="page-item active">
							<a href="index.jsp?main=board/boardList.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
						</li>
					<%}else
					{%>
						<li>
							<a href="index.jsp?main=board/boardList.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
						</li>
					<%}
				}
				if(endPage<totalPage)
				{%>
					<li>
						<a href="index.jsp?main=board/boardList.jsp?currentPage=<%=endPage+1%>" class="page-link">다음</a>
					</li>
				<%}	
				%>
			</ul>
	</div>
</body>
</html>