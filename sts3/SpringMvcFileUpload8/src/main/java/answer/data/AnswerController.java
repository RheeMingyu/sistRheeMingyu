package answer.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AnswerController {

	@Autowired
	AnswerDaoInter adao;
	
	@PostMapping("/board/ainsert")
	public String insert(@ModelAttribute AnswerDto dto,@RequestParam int currentPage) {
		
		adao.insertAnswer(dto);
		adao.controlViewcount(dto.getNum());
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
}
