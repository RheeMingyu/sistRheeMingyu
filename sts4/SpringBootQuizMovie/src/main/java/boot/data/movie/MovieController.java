package boot.data.movie;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
public class MovieController {

	@Autowired
	MovieDao dao;
	
	@GetMapping("/")
	public String start() {
		return "redirect:list";
	}
	
	@GetMapping("/movie/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("movieList");

		model.addObject("totalcount", dao.getTotalCount());
		model.addObject("mlist", dao.getAllMovies());
		
		return model;
	}
	
	@GetMapping("/movie/writeform")
	public String writeform() {
		return "addForm";
	}
	
	@PostMapping("/movie/insert")
	public String insert(@ModelAttribute("dto") MovieDto dto,
			MultipartFile multi,
			HttpSession session) {
		
		if(!multi.getOriginalFilename().equals("")) {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			String path=session.getServletContext().getRealPath("/moviephoto");
			String photo=sdf.format(new Date())+multi.getOriginalFilename();
			
			try {
				multi.transferTo(new File(path+"\\"+photo));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setMv_poster(photo);
		}
		else {
			dto.setMv_poster("null");
		}
		dao.insertMovie(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/movie/detail")
	public String detail(Model model,@RequestParam long num) {
		
		MovieDto mdto=dao.getSingleMovie(num);
		model.addAttribute("mdto", mdto);
		
		int ranper=(int)(Math.random()*100);
		
		int ranstar_draft=(int)(Math.random()*10);
		int ranstar=ranstar_draft==0?1:ranstar_draft;
		
		model.addAttribute("ranper", ranper);
		model.addAttribute("ranstar", ranstar);
		
		return "detail";
	}
	
	@GetMapping("/movie/delete")
	public String delete(@RequestParam long num,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/moviephoto");
		
		String oldphoto=dao.getSingleMovie(num).getMv_poster();
		
		if(!oldphoto.equals("null")) {
			File file=new File(path+"\\"+oldphoto);
			file.delete();
		}
		dao.deleteMovie(num);
		
		return "redirect:list";
	}
}
