package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {

	@GetMapping("/happy")
	public String onlyImage() {
		return "quiz1";
	}
	
	@GetMapping("/hello")
	public ModelAndView msgAndImage() {
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("msg", "�׳� �޽���");
		mv.setViewName("quiz2");
		
		return mv;
	}
	
	@GetMapping("/nice")
	public ModelAndView onlyMsg() {
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("name", "�迵ȯ");
		mv.addObject("age", 21);
		mv.addObject("addr", "���￪ ȭ���");
		
		mv.setViewName("quiz3");
		
		return mv;
	}
}
