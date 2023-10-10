package spring.mvc.samsung;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.ShopDto;

@Controller
public class ShopController {

	@GetMapping("/shop/list")
	public String result3() {
		return "shop/list";
	}
	
	@GetMapping("/shop/form2")
	public String form2() {
		return "shop/shopForm";
	}
	
	@PostMapping("/shop/process2")
	public String process2(@ModelAttribute ShopDto dto) {
		//@ModelAttribute자체가 앞글자 소문자로 변환해서 넘겨줌	
		//@ModelAttribute("dto1") ShopDto dto을 인자로 주면 dto1으로 넘겨줌(dto 아님)
		return "shop/shopResult";
	}
	
	@GetMapping("/shop/form3")
	public String form3() {
		return "shop/mapForm";
	}
	
	@PostMapping("/shop/process3")
	public ModelAndView process3(@RequestParam Map<String, String> map) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("shop/mapResult");
		
		model.addObject("name", map.get("name"));
		model.addObject("java", map.get("java"));
		model.addObject("spring", map.get("spring"));
		model.addObject("jquery", map.get("jquery"));
		
		return model;
	}
}
