package answer.data;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.reboard.BoardDaoInter;

@RestController
public class AnswerRestController {

	@Autowired
	BoardDaoInter bdao;
	
	@Autowired
	AnswerDaoInter adao;
	
	@GetMapping("/board/delete")
	public Map<String, Integer> delete(@RequestParam int idx,int pass,int num) {
		
		int flag=adao.authentification(idx, pass);
		int val=0;
		
		if(flag!=0) {
			adao.deleteAnswer(idx);
			val=1;
			adao.controlViewcount(num);
		}
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("no", val);
			
		return map;
	}
}
