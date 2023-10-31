package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	@GetMapping("/member/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/member/memberList");
		
		List<MemberDto> list=service.getAllMembers();
		model.addObject("list", list);
		model.addObject("totalcount", list.size());
		
		return model;
	}
	
	@GetMapping("/member/form")
	public ModelAndView form() {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/member/addForm");
		
		return model;
	}
	
	@GetMapping("/member/myinfo")
	public String myinfo(Model model) {
		
		List<MemberDto> list=service.getAllMembers();
		model.addAttribute("list", list);
		
		return "/member/myInfo"	;
	}
	
	@GetMapping("/member/idcheck")
	public @ResponseBody Map<String, String> idcheck(@RequestParam String id) {
		
		Map<String, String> map=new HashMap<>();
		
		int check=service.getSearchId(id);
		
		if(check==0)
			map.put("check", "사용가능한 아이디입니다");
		else
			map.put("check", "사용중인 아이디입니다");
		
		return map;
	}
	
	@PostMapping("/member/insert")
	public ModelAndView insert(@ModelAttribute("dto") MemberDto dto,
			MultipartFile multi,
			HttpSession session) {
		
		ModelAndView model=new ModelAndView();
		if(dto.getId().equals("admin"))
			model.setViewName("redirect:list");
		else
			model.setViewName("redirect:gaipsuccess");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String path=session.getServletContext().getRealPath("/membersave");		
		
		String fName=multi.getOriginalFilename();
		String photo=sdf.format(new Date())+"_"+fName;
		
		try {
			multi.transferTo(new File(path+"\\"+photo));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		dto.setPhoto(photo);
		
		service.insertMember(dto);
		
		return model;
	}
	
	@GetMapping("/member/gaipsuccess")
	public String gaip() {
		return "/member/gaipSuccess";
	}
	
	@GetMapping("/member/delete")
	@ResponseBody
	public void delete(@RequestParam String num,HttpSession session) {
		
		/*num=num.substring(0, num.length()-1);
		String [] numarr=num.split(",");
		
		for(String n:numarr) {
			service.deleteMember(n);
		}
		
		return "redirect:list";*/
		
		String path=session.getServletContext().getRealPath("/membersave");
		String photo=service.getDataByNum(num).getPhoto();
		File file=new File(path+"\\"+photo);
		file.delete();
		
		service.deleteMember(num);
		
		session.removeAttribute("myid");
		session.removeAttribute("loginok");
		session.removeAttribute("saveok");
		session.removeAttribute("loginphoto");
	}
	
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void modify(@RequestParam String num,
			MultipartFile photo, //MultipartFile객체 참조변수명 반드시 db의 컬럼명과 일치
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/membersave");
		String oldphoto=service.getDataByNum(num).getPhoto();
		File file=new File(path+"\\"+oldphoto);
		file.delete();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String newphoto=sdf.format(new Date())+"_"+photo.getOriginalFilename();

		try {
			photo.transferTo(new File(path+"\\"+newphoto));
			service.updatePhoto(num, newphoto);
			
			session.setAttribute("loginphoto", newphoto);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping("/member/updatemember")
	public String updateform(Model model,@RequestParam String num) {
		
		MemberDto mdto=service.getMember(num);
		model.addAttribute("mdto", mdto);
		
		return "/member/updateForm";
	}
	
	@PostMapping("/member/update")
	public String update(@ModelAttribute("mdto") MemberDto dto) {
		
		service.updateMember(dto);
		
		return "redirect:myinfo";
	}
}
