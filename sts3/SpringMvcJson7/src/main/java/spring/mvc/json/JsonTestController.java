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
	@ResponseBody //json���� ó���� �������� ���(�Ϲ� ��Ʈ�ѷ��ϰ��)
	public Map<String, String> list1() {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "�����");
		map.put("hp", "010-4924-0731");
		map.put("addr", "������ ��ȱ�"); //{"name":"�����","hp":~,"addr":~} json�������� ����
		
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
		list.add(new PhotoDto("bull", "star5.png")); //dto�� �ڵ����� json�������� �Ľ�
		
		return list;
	}
}
