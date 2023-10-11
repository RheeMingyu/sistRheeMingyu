package spring.mysql.mycar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model model) {
		
		//dao로부터 총개수가져오기
		int totalCount=dao.getTotalCount();
		
		//목록 가져오기
		List<MyCarDto> list=dao.getAllCars();
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "car/carList";
	}
	
	@GetMapping("/kakao/writeForm")
	public String carform() {
		return "car/writeForm";
	}
	
	@PostMapping("/kakao/read")
	public String carinsert(@ModelAttribute("dto") MyCarDto dto) {
		
		dao.insertCar(dto);
		
		return "redirect:list"; //redirect시에는 중간경로 빼고 마지막 경로만
	}
	
	@GetMapping("/kakao/deleteForm")
	public String cardelete(@RequestParam String num) {
		
		dao.deleteCar(num);
		
		return "redirect:list";
	}
	
}
