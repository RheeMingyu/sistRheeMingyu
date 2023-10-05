package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {

	@GetMapping("/apple/list.do") //list�ڿ� .do�� �ٸ� Ȯ���ڸ� ���̵� ��ȣ���
	public String result1(Model model) {
		
		model.addAttribute("monster", "�迵ȯ");
		model.addAttribute("elite", "ȫ�ڻ�");
		
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		
		//ModelAndView�� request�� �����ϱ� ���� Model��
		//������ �ϱ����� View�� ���ĳ��� Ŭ�����Դϴ�
		ModelAndView mv=new ModelAndView();
		
		//request�� ����
		mv.addObject("java", 88);
		mv.addObject("spring", 99);
		
		//�������� jsp���� ����
		mv.setViewName("result2");
		
		return mv;
	}
	
	@GetMapping("/orange/delete")
	public String orange(Model model) {
		
		model.addAttribute("sang", "�迵ȯ");
		model.addAttribute("chicken", "ȣ����");
		model.addAttribute("color", "Ȳ��");
		
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
