package spring.mvc.json;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController //json���� ó���ؼ� �������� ��¸��� ���� ��Ʈ�ѷ�(jsonó�� ���� ��Ʈ�ѷ�)
public class JsonTest2Controller {

	@GetMapping("/list2")
	public Map<String, String> ex2() {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("sang", "���");
		map.put("price", "9000");
		map.put("count", "4");
		
		return map;
	}
}
