package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("list");
		
		model.addObject("name", "김영환");
		model.addObject("addr", "강남구 논현동");
		
		return model;
	}
}
