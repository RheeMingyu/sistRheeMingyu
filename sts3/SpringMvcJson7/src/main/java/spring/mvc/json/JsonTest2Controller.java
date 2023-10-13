package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/list4")
	public Map<String, Object> list4(@RequestParam String name) {
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("yellow", "s1.JPG"));
		list.add(new PhotoDto("red", "s2.JPG"));
		list.add(new PhotoDto("blue", "s3.JPG"));
		list.add(new PhotoDto("snoop", "s4.JPG"));
		list.add(new PhotoDto("pink", "s5.JPG"));
		list.add(new PhotoDto("bull", "star5.png"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", "���¾���");
		map.put("photo", "hi.jpg");
		
		for(PhotoDto dto:list) {
			
			if(name.equals(dto.getName())) {
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		return map;
	}
}
