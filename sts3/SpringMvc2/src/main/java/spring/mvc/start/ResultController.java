package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {

	@GetMapping("/apple/list.do") //list뒤에 .do나 다른 확장자를 붙이든 다호출됨
	public String result1(Model model) {
		
		model.addAttribute("monster", "김영환");
		model.addAttribute("elite", "홍박사");
		
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		
		//ModelAndView는 request에 저장하기 위한 Model과
		//포워드 하기위한 View를 합쳐놓은 클래스입니다
		ModelAndView mv=new ModelAndView();
		
		//request에 저장
		mv.addObject("java", 88);
		mv.addObject("spring", 99);
		
		//포워드할 jsp파일 지정
		mv.setViewName("result2");
		
		return mv;
	}
	
	@GetMapping("/orange/delete")
	public String orange(Model model) {
		
		model.addAttribute("sang", "김영환");
		model.addAttribute("chicken", "호스기");
		model.addAttribute("color", "황금");
		
		return "result3";
	}
	
	@GetMapping("/shop/detail")
	public String resImage() {
		return "result4";
	}
	
	@GetMapping("/board/insert/data")
	public String webImage() {
		return "result5";
	}
}
