package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReBoardController {
	
	@GetMapping("/board/liststart")
	public String liststart() {
		return "/hosg/reboard/start";
	}

	@GetMapping("/board/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/sub/reboard/boardList");
		
		return model;
	}
}
