package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDaoInter;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardWriteController {
	
	@Autowired
	BoardDaoInter dao;

	@GetMapping("/board/writeForm")
	public String writeform(Model model,@RequestParam Map<String, String> map) {
		
		//요 5개는 답글일 경우에만 넘어온다(새글일경우 안넘어옴)
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String regroup=map.get("regroup");
		String restep=map.get("restep");
		String relevel=map.get("relevel");
		
		//System.out.println(currentPage+","+num);
		
		//입력폼에 hidden으로 넣어줘야함..답글일때 대비
		model.addAttribute("currentPage", currentPage==null?"1":currentPage);
		model.addAttribute("num", num==null?"0":num);
		model.addAttribute("regroup", regroup==null?"0":regroup);
		model.addAttribute("restep", restep==null?"0":restep);
		model.addAttribute("relevel", relevel==null?"0":relevel); //dao설정에 따라 디폴트값 0으로
		
		//0으로 넣어야 dao에서 새글로 인식
		//폼이 답글,새글 공용이므로
		
		return "reboard/writeForm";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> uimage, //업로드 파일 여러개라서
			HttpSession session,
			@RequestParam int currentPage) {
		
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		if(uimage.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
			
			for(MultipartFile f:uimage) {
				
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				photo+=fName+",";
				
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//photo에서 마지막 컴마 제거
			photo=photo.substring(0, photo.length()-1);
		}
		//dto의 photo에 넣기
		dto.setPhoto(photo);
		
		//insert
		dao.insertReboard(dto);
		
		int num=dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+currentPage; //content일단 없으니까 목록으로
	}
}
