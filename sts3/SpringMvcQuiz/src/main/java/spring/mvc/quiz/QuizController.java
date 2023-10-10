package spring.mvc.quiz;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.quiz.dto.FormDto;

@Controller
public class QuizController {

	@GetMapping("/ilike/movie")
	public ModelAndView read1(@RequestParam(value = "title",defaultValue = "제목없음") String title) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("result1");
		
		mv.addObject("title", title);
		
		return mv;
	}
	
	@GetMapping("/school/myinfo")
	public ModelAndView read2(String stname,String stschool,String grade,String addr) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("result2");
		
		mv.addObject("name", stname);
		mv.addObject("school", stschool);
		mv.addObject("grade", grade);
		mv.addObject("addr", addr);
		
		return mv;
	}
	
	@PostMapping("/shop/ipgo")
	public ModelAndView read3(@ModelAttribute FormDto dto) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("result3");
		
		mv.addObject("dto", dto);
		
		return mv;
	}
	
	@PostMapping("/myshinsang")
	public ModelAndView read4(@RequestParam Map<String, String> map) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("result4");
		
		mv.addObject("name", map.get("myname"));
		mv.addObject("age", map.get("age"));
		mv.addObject("bldtype", map.get("bldtype"));
		mv.addObject("addr", map.get("addr"));
		
		return mv;
	}
}
