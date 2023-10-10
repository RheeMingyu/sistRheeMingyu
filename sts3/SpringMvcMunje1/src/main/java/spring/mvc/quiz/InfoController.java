package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.data.dto.InfoDto;

@Controller
public class InfoController {

	@GetMapping("/info/form")
	public String start() {
		return "info/infoForm";
	}
	
	@PostMapping("/info/result")
	public String process(@ModelAttribute("dto") InfoDto dto) {
		
		if(dto.getHobby()==null)
			dto.setHobby("¾øÀ½");

		return "info/infoWrite";
	}
}
