package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDaoInter;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardUpdateController {

	@Autowired
	BoardDaoInter dao;
	
	@GetMapping("/board/updatePassForm")
	public ModelAndView upassform(@RequestParam String num,@RequestParam String currentPage) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("reboard/updatePassForm");
		
		mv.addObject("num", num);
		mv.addObject("currentPage", currentPage);
		
		return mv;
	}
	
	@PostMapping("/board/updatePass")
	public String upass(Model model,@RequestParam int num,int pass,int currentPage) {
		
		int flag=dao.authentification(num, pass);
		
		String mapping="";
		//비번이 맞으면 수정폼으로,틀리면 passFail로
		mapping=(flag==0?"reboard/passFail":"reboard/updateForm");
		
		BoardDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return mapping;
	}
	
	@PostMapping("/board/update")
	public String update(Model model,@ModelAttribute BoardDto dto,@RequestParam int currentPage,
			@RequestParam List<MultipartFile> modimage,
			HttpSession session) {
		
		String newphoto="";
		
		if(modimage.get(0).getOriginalFilename().equals(""))
			newphoto="no";
		else {
			
			String oldphoto=dao.getData(dto.getNum()).getPhoto();
			String [] oldphotoes=oldphoto.split(",");
			
			String path=session.getServletContext().getRealPath("/WEB-INF/photo");
			
			for(String o:oldphotoes) {
				
				File file=new File(path+"\\"+o);
				file.delete();
			}

			for(MultipartFile f:modimage) {
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				
				newphoto+=fName+",";

				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			newphoto=newphoto.substring(0, newphoto.length()-1);
		}
		dto.setPhoto(newphoto);		
		
		dao.updateData(dto);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("dto", dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
}
