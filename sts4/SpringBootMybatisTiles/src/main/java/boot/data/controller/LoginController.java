package boot.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	MemberService service;

	@GetMapping("/login/main")
	public String loginform(HttpSession session,Model model) {
		
		String myid=(String)session.getAttribute("myid");
		String loginok=(String)session.getAttribute("loginok");
		
		if(loginok==null)
			return "/login/loginForm";
		else {
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			return "/sub/login/logoutForm";
		}
	}
	
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,String pass,
			@RequestParam(required = false) String save,
			HttpSession session) {
		
		HashMap<String, String> map=new HashMap<>();
		int check=service.loginPassCheck(id, pass);
		
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", save);
			
			MemberDto mdto=service.getDataById(id);
			session.setAttribute("loginphoto", mdto.getPhoto());
			
			return "redirect:main";
		}
		else {
			return "/sub/member/passFail";
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		
		return "redirect:main";
	}
}
