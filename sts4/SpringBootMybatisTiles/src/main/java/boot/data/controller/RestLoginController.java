package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
public class RestLoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/login")
	public Map<String, String> loginproc(String id,String pass,HttpSession session){
		
		Map<String, String> map=new HashMap<>();
		
		int result=service.loginPassCheck(id, pass);
		
		if(result==1) {
			session.setMaxInactiveInterval(60*60*4);
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			
			MemberDto mdto=service.getDataById(id);
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("loginname", mdto.getName()); //그냥 추가
		}
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	
	@GetMapping("/member/logout")
	public void logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}
	
	@GetMapping("/member/updatemodalform")
	public Map<String, String> updatemodalform(String num,String selinfo) {
		
		Map<String, String> map=new HashMap<>();
		String newinfo="";
		
		MemberDto mdto=service.getDataByNum(num);
		
		if(selinfo.equals("name"))
			newinfo=mdto.getName();
		else if(selinfo.equals("addr"))
			newinfo=mdto.getAddr();
		else if(selinfo.equals("email"))
			newinfo=mdto.getEmail();
		
		map.put("newinfo", newinfo);
		//map.put("selinfo", selinfo);
		
		return map;
	}
	
	@GetMapping("/member/updatemodal")
	public void updatemodal(String num,String selinfo,String newinfo,HttpSession session) {
		
		MemberDto mdto=service.getDataByNum(num);
		
		if(selinfo.equals("name")) {
			mdto.setName(newinfo);
			session.setAttribute("loginname", newinfo);
		}
		else if(selinfo.equals("addr"))
			mdto.setAddr(newinfo);
		else if(selinfo.equals("email"))
			mdto.setEmail(newinfo);
		
		service.updateMember(mdto);
	}
}
