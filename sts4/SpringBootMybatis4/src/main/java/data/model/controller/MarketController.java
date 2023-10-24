package data.model.controller;

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

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.mapper.MarketService;

@Controller
public class MarketController {

	//@Autowired
	//MarketMapperInter mapper;
	
	@Autowired
	MarketService service;
	
	@GetMapping("/")
	public String start() {
		return "redirect:market/list"; //루트이므로 중간경로 포함
	}
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		//db로부터 총개수 얻기
		int totalCount=service.getTotalCount();
		
		//저장
		model.addObject("totalCount", totalCount);
		//포워드
		model.setViewName("market/marketList");
		
		List<MarketDto> list=service.getAllSangs();
		model.addObject("list", list);
		
		return model;
	}
	
	@GetMapping("/market/writeform")
	public String addform() {
		return "market/addForm";
	}
	
	@PostMapping("/market/add")
	public ModelAndView add(@ModelAttribute("mdto") MarketDto dto,
			MultipartFile multi,
			HttpSession session) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("redirect:list");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String path=session.getServletContext().getRealPath("save");
		
		String fName=multi.getOriginalFilename();
		String photo=sdf.format(new Date())+fName;
		
		if(!fName.equals("")) {
			try {
				multi.transferTo(new File(path+"\\"+photo));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setPhotoname(photo);
		}
		
		service.insertMarket(dto);
		
		return model;		
	}
	
	@GetMapping("/market/updateform")
	public String updateform(Model model,@RequestParam int num) {
		
		MarketDto dto=service.getData(num);
		model.addAttribute("dto", dto);
		
		return "market/updateForm";
	}
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute("mdto") MarketDto dto,
			MultipartFile multi,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/save");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String newfName=multi.getOriginalFilename();
		String newphoto=sdf.format(new Date())+newfName;
		
		String oldphoto=service.getData(dto.getNum()).getPhotoname();
		
		if(!newfName.equals("")) {
			try {
				multi.transferTo(new File(path+"\\"+newphoto));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setPhotoname(newphoto);
			
			File file=new File(path+"\\"+oldphoto);
			file.delete();
		}		
		service.updateMarket(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam int num,
			HttpSession session) {
		
		String fName=service.getData(num).getPhotoname();
		
		if(!fName.equals("")) {
			String path=session.getServletContext().getRealPath("/save");
			
			File file=new File(path+"\\"+fName);
			file.delete();
		}
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}
}
