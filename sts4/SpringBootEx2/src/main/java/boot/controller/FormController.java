package boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.dto.PersonDto;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1() {
		return "form/form1";
	}
	
	@GetMapping("/sist/form2")
	public String form2() {
		return "form/form2";
	}
	
	@GetMapping("/sist/form3")
	public String form3() {
		return "form/form3";
	}
	
	@PostMapping("/sist/read1")
	public String result1(Model model,@RequestParam String irum,String java,String spring) {
		
		model.addAttribute("irum", irum);
		model.addAttribute("java", java);
		model.addAttribute("spring", spring);
		
		return "result/result1";
	}
	
	@PostMapping("/sist/write2")
	public String write1(@ModelAttribute("dto") PersonDto dto) {
		return "result/result2";
	}
	
	@PostMapping("/sist/myread") //map으로 읽을경우 name이 key값으로 입력값은 value
	public String myread(Model model,@RequestParam Map<String, String> map) { //Map은 RequestParam 생략불가
		//Map을 전달하면 map.name형식으로 받아야함
		
		/*model.addAttribute("name", map.get("name"));
		model.addAttribute("blood", map.get("blood"));
		model.addAttribute("age", map.get("age"));*/
		
		model.addAttribute("map", map);
		
		return "result/result3";
	}
}
