package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		//db로부터 총개수 얻기
		int totalCount=mapper.getTotalCount();
		
		//저장
		model.addObject("totalCount", totalCount);
		//포워드
		model.setViewName("market/marketList");
		
		List<MarketDto> list=mapper.getAllSangs();
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
		
		mapper.insertMarket(dto);
		
		return model;		
	}
}
