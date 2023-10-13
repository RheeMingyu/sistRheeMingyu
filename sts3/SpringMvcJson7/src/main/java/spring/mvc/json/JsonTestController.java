package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody //json으로 처리후 브라우저로 출력(일반 컨트롤러일경우)
	public Map<String, String> list1() {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "장순영");
		map.put("hp", "010-4924-0731");
		map.put("addr", "수원시 장안구"); //{"name":"장순영","hp":~,"addr":~} json형식으로 저장
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3() {
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("yellow", "s1.JPG"));
		list.add(new PhotoDto("red", "s2.JPG"));
		list.add(new PhotoDto("blue", "s3.JPG"));
		list.add(new PhotoDto("snoop", "s4.JPG"));
		list.add(new PhotoDto("pink", "s5.JPG"));
		list.add(new PhotoDto("bull", "star5.png")); //dto를 자동으로 json형식으로 파싱
		
		return list;
	}
}
