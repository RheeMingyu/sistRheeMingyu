package spring.mvc.friday;

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
import org.springframework.web.multipart.MultipartFile;

@Controller
public class InfoController {
	
	@Autowired
	InfoInter inter;
	
	@GetMapping("/info/list")
	public String list(Model model,
			@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search) {
		
		int count=inter.getTotalCount();
		
		//List<InfoDto> list=inter.getAllInfo();
		System.out.println(title+","+search);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("title", title);
		
		List<InfoDto> list=inter.getAllInfo(map);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		model.addAttribute("search", search);
		model.addAttribute("title", title);
		
		return "info/infoList";
	}
	
	@GetMapping("/info/addForm")
	public String addform() {
		return "info/addForm";
	}
	
	@PostMapping("/info/insert")
	public String insert(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
		String photo="";
		
		//사진선택을 안했을경우 no
		if(upload.getOriginalFilename().equals(""))
			photo="no";
		else {
			String fName=upload.getOriginalFilename();
			photo=sdf.format(new Date())+"_"+fName;
			
			try {
				upload.transferTo(new File(path+"\\"+photo));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//dto의 photo에 넣기
		dto.setPhoto(photo);
		
		//insert
		inter.insertInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/uform")
	public String updateForm(String num,Model model) {
		
		InfoDto dto=inter.getInfo(num);
		model.addAttribute("dto", dto);
		
		return "info/updateForm";
	}
	
	@PostMapping("/info/update")
	public String update(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
		String newphoto;
		
		//사진선택안할경우 null
		if(upload.getOriginalFilename().equals(""))
			newphoto=null;
		else {
			newphoto=sdf.format(new Date())+"_"+upload.getOriginalFilename();
			
			//삭제
			String oldphoto=inter.getInfo(dto.getNum()).getPhoto();
			File file=new File(path+"\\"+oldphoto);
			file.delete();
			//업로드
			try {
				upload.transferTo(new File(path+"\\"+newphoto));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//dto의 photo에 업로드한 newphoto
		dto.setPhoto(newphoto);
		
		inter.updateInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/delete")
	public String delete(String num,HttpSession session) {
		
		String photo=inter.getInfo(num).getPhoto();
		
		if(!photo.equals("no")) {
			
			String path=session.getServletContext().getRealPath("/resources/image");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		inter.deleteInfo(num);
		
		return "redirect:list";
	}
}
