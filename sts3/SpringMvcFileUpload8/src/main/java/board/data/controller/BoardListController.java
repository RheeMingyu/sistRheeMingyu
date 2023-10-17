package board.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.reboard.BoardDaoInter;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardListController {

	@Autowired
	BoardDaoInter dao;
	
	@GetMapping("board/list")
	public String list(Model model,
			@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
		//페이징처리에 필요한 변수선언
		int totalCount=dao.getTotalCount();
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수
		
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		startPage=(currentPage-1)/perBlock*perBlock+1;
		     
		endPage=startPage+perBlock-1;
 
		 if(endPage>totalPage)
			 endPage=totalPage;

		startNum=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 가져오기
		List<BoardDto> list=dao.getPagingList(startNum, perPage);
		
		//각 페이지에 출력할 시작번호
		int no=totalCount-startNum;
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("no", no);
		model.addAttribute("currentPage", currentPage);
		
		return "reboard/boardList";
	}
}
