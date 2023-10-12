package spring.mysql.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberInter inter; //Autowired는 생성과 유사한 역할이므로 Repository에 등록된 클래스가 다형성으로 생성됨
	//Repository는 클래스만 등록됨,인터페이스는 등록안됨
	
	@GetMapping("/member/list")
	public String list(Model model) {
		
		//개수가져오기
		int count=inter.getTotalCount();
		List<CarMemberDto> list=inter.getAllMember();
		
		//request에 저장
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "carmember/memberList";
	}
	
	@GetMapping("/member/writeForm")
	public String insertForm() {
		return "carmember/addForm";
	}
	
	@PostMapping("/member/write")
	public String insert(@ModelAttribute CarMemberDto dto) {
		
		inter.insertMember(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/updateForm")
	public String updateForm(@RequestParam int num,Model model) {
		
		CarMemberDto dto=inter.getMember(num);
		
		model.addAttribute("dto", dto);
		
		return "carmember/updateForm";
	}
	
	@PostMapping("/member/update")
	public String update(@ModelAttribute CarMemberDto dto) {
		
		inter.updateMember(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/delete")
	public String delete(@RequestParam int num) {
		
		inter.deleteMember(num);
		
		return "redirect:list";
	}
}
