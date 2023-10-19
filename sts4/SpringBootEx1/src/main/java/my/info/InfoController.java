package my.info;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InfoController {

	@GetMapping("/my/info")
	public @ResponseBody Map<String, String> test() {
		
		Map<String, String> map=new HashMap<>();
		map.put("name", "장순영");
		map.put("age", "23");
		map.put("addr", "서울시 강남구");
		
		return map;
	}
}
