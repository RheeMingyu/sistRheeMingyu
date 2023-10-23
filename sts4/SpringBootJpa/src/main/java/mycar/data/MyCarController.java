package mycar.data;

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

@Controller
public class MyCarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/car/carlist") //시작..
	public String form(Model model) {
		
		List<MyCarDto> list=dao.getAllData();
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount", list.size());
		
		return "carList";
	}
	
	@GetMapping("/car/carform")
	public String form() {
		return "addForm";
	}
	
	//insert
	@PostMapping("/car/insert")
	public String insert(@ModelAttribute("dto") MyCarDto dto,
			MultipartFile carupload,
			HttpSession session) {
		
		//dao.insertMyCar(dto);
		
		String path=session.getServletContext().getRealPath("save");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fName=carupload.getOriginalFilename();
		String photo=sdf.format(new Date())+fName;
		
		try {
			carupload.transferTo(new File(path+"\\"+photo));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dto.setCarphoto(photo);
		dao.insertMyCar(dto);
		
		return "redirect:carlist";
	}
	
	@GetMapping("/car/updateform")
	public String updateform(Model model,@RequestParam long num) {
		
		model.addAttribute("dto", dao.getData(num));
		
		return "uform";
	}
	
	@PostMapping("/car/update")
	public String update(Model model,@ModelAttribute("dto") MyCarDto dto) {
		
		dao.updateMyCar(dto);
		
		return "redirect:carlist";
	}
	
	@GetMapping("/car/delete")
	public String delete(@RequestParam long num) {
		
		dao.deleteMyCar(num);
		
		return "redirect:carlist";
	}
	
	@GetMapping("car/detail")
	public String detail(Model model,@RequestParam long num) {
		
		MyCarDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		
		return "detail";
	}
}
