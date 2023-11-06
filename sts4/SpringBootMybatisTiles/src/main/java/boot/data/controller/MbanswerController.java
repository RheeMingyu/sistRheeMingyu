package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.MbanswerDto;
import boot.data.mapper.MbanswerMapperInter;
import boot.data.service.MemberService;

@Controller
@RequestMapping("/mbanswer")
public class MbanswerController {

	@Autowired
	MbanswerMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	@PostMapping("/ainsert")
	public @ResponseBody void insert(@ModelAttribute("mbdto") MbanswerDto mbdto,
			HttpSession session) {

		String check=mbdto.getContent().trim();
		if(!check.equals("")) {
			mbdto.setMyid((String)session.getAttribute("myid"));
			mbdto.setName((String)session.getAttribute("loginname"));
			mapper.insertMbanswer(mbdto);
		}
	}
	
	@GetMapping("/alist")
	public @ResponseBody List<MbanswerDto> list(@RequestParam String num){
		return mapper.getAllAnswers(num);
	}
	
	@PostMapping("/adelete")
	public @ResponseBody void delete(String idx) {
		mapper.deleteAnswer(idx);
	}
	
	@PostMapping("/aupdate")
	public @ResponseBody void update(String idx,String content) {
		
		MbanswerDto mbdto=mapper.getAnswer(idx);
		mbdto.setIdx(idx);
		mbdto.setContent(content);
		
		mapper.updateAnswer(mbdto);
	}
}
