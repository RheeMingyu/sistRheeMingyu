package board.data.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.reboard.BoardDaoInter;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardContentController {
	
	@Autowired
	BoardDaoInter dao;

	@GetMapping("/board/content")
	public String content(Model model,@RequestParam int num,int currentPage) {
		
		BoardDto dto=dao.getContent(num);
		
		dto.setPhoto(dto.getPhoto().substring(0, dto.getPhoto().length()-1));
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "reboard/content";
	}
}
