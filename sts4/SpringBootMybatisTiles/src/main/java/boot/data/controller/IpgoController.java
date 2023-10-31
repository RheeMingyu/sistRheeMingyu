package boot.data.controller;

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

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {

	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "/layout/main"; //root파일 매핑주소는 무조건 main
	}
	
	/*@GetMapping("/")
	public String start() {
		return "redirect:ipgo/list";
	}*/
	
	@GetMapping("/ipgo/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		//model.setViewName("ipgoList"); //jsp resolver
		model.setViewName("/ipgo/ipgoList"); //tiles resolver경로
		
		int totalcount=mapper.getTotalCount();
		model.addObject("totalcount", totalcount);
		
		List<IpgoDto> list=mapper.getAllIpgos();
		model.addObject("list", list);
		
		return model;
	}
	
	@GetMapping("/ipgo/ipgoform")
	public String form() {
		return "/ipgo/ipgoForm";
	}
	
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute("dto") IpgoDto dto,
			ArrayList<MultipartFile> multi,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		String ufName="";
		
		if(multi.get(0).getOriginalFilename().equals(""))
			ufName="no";
		else {
			for(MultipartFile f:multi) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				ufName+=fName+",";
				
				//업로드
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
			ufName=ufName.substring(0, ufName.length()-1);
		}
		dto.setPhotoname(ufName);
		
		mapper.insertIpgo(dto);
		
		return "redirect:list";
	}
}
