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
		
		//dao�κ��� �Ѱ�����������
		int totalCount=dao.getTotalCount();
		
		//��� ��������
		List<MyCarDto> list=dao.getAllCars();
		
		//request�� ����
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
		
		return "redirect:list"; //redirect�ÿ��� �߰���� ���� ������ ��θ�
	}
	
	@GetMapping("/kakao/deleteForm")
	public String cardelete(@RequestParam String num) {
		
		dao.deleteCar(num);
		
		return "redirect:list";
	}
	
}
