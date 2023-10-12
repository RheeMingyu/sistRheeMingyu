package spring.mvc.json;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController //json으로 처리해서 브라우저로 출력만을 위한 컨트롤러(json처리 전용 컨트롤러)
public class JsonTest2Controller {

	@GetMapping("/list2")
	public Map<String, String> ex2() {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("sang", "돈까스");
		map.put("price", "9000");
		map.put("count", "4");
		
		return map;
	}
}
