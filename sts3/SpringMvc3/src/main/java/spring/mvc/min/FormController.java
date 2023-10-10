package spring.mvc.min;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.FormDto;

@Controller
public class FormController {

	@GetMapping("/data/myform")
	public String myforms() {
		return "myforms";
	}
	
	//read1_get방식폼 전송
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam(value = "myname") String name,@RequestParam int myage,
			@RequestParam(value = "msg",defaultValue = "HappyDay") String msg) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("process1");
		
		mv.addObject("name", name);
		mv.addObject("age", myage);
		mv.addObject("msg", msg);
		
		return mv;
	}
	
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute FormDto dto) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("process2");
		
		mv.addObject("dto", dto);
		
		return mv;
	}
	
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("process3");
		
		String sang=map.get("sang");
		String price=map.get("price");
		
		String data=sang+"의 가격은 "+price+"입니다";
		
		mv.addObject("data", data);
		
		return mv;
	}
}
