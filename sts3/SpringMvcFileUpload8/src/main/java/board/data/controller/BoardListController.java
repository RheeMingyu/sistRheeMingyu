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
		
		//����¡ó���� �ʿ��� ��������
		int totalCount=dao.getTotalCount();
		int totalPage; //�� ��������
		int startPage; //�������� ������ ����������
		int endPage; //�������� ������ ��������
		int startNum; //db���� ������ ���� ���۹�ȣ(mysql�� ù���� 0,����Ŭ�� 1)
		int perPage=10; //���������� ������ ���� ����
		int perBlock=5; //�Ѻ��� ������ ������ ����
		
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		startPage=(currentPage-1)/perBlock*perBlock+1;
		     
		endPage=startPage+perBlock-1;
 
		 if(endPage>totalPage)
			 endPage=totalPage;

		startNum=(currentPage-1)*perPage;

		//������������ �ʿ��� �Խñ� ��������
		List<BoardDto> list=dao.getPagingList(startNum, perPage);
		
		//�� �������� ����� ���۹�ȣ
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
