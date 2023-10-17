package board.data.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDaoInter;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardDeleteController {

	@Autowired
	BoardDaoInter dao;
	
	@GetMapping("/board/deletePassForm")
	public ModelAndView dpassform(@RequestParam String num,@RequestParam String currentPage) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("reboard/deletePassForm");
		
		mv.addObject("num", num);
		mv.addObject("currentPage", currentPage);
		
		return mv;
	}
	
	@PostMapping("/board/deletePass")
	public String dpass(Model model,int num,int pass,HttpSession session) {
		
		int flag=dao.authentification(num, pass);
		
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		
		BoardDto dto=dao.getData(num);
		
		String mapping="";
		//비번이 맞으면 수정폼으로,틀리면 passFail로
		mapping=(flag==0?"reboard/passFail":"redirect:list");
		
		if(mapping.equals("redirect:list")) {

			if(!dao.getData(num).getPhoto().equals("no")) {
				
				String [] oldphotoes=dao.getData(num).getPhoto().split(",");
				
				for(String o:oldphotoes) {
					
					File file=new File(path+"\\"+o);
					file.delete();
				}
			}
			dao.deleteCascade(dto);
		}
		model.addAttribute("dto", dto);
		
		return mapping;
	}
}
