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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@Controller
@RequestMapping("/reboard")
public class ReBoardController {
	
	@Autowired
	ReboardService service;
	
	/*@GetMapping("/board/liststart")
	public String liststart() {
		return "/hosg/reboard/start";
	}*/

	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw) { //null 넘어올 경우 대비
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/sub/reboard/boardList");
		
		//페이징에 필요한 변수
		int totalcount=service.getTotalCount(sc, sw);
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=3; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수
		
		totalPage=totalcount/perPage+(totalcount%perPage==0?0:1);

		startPage=(currentPage-1)/perBlock*perBlock+1;
		     
		endPage=startPage+perBlock-1;
 
		 if(endPage>totalPage)
			 endPage=totalPage;

		startNum=(currentPage-1)*perPage;
		int printNum=totalcount-startNum;
		
		List<ReboardDto> list=service.getPagingList(sc, sw, startNum, perPage);
		
		model.addObject("list", list);
		model.addObject("totalcount", totalcount);
		model.addObject("currentPage", currentPage);
		model.addObject("totalpage", totalPage);
		model.addObject("startpage", startPage);
		model.addObject("endpage", endPage);
		model.addObject("startnum", startNum);
		model.addObject("perpage", perPage);
		model.addObject("perblock", perBlock);
		model.addObject("printnum", printNum);
		//System.out.println("totalcount="+totalcount);
		
		return model;
	}
	
	@GetMapping("/form")
	public String reform(@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		//답글일 경우에만 넘어오는 값들이다
		//새글일 경우는 모두 null이므로 defaultValue만 값으로 전달
		
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		//새글일경우는 "",답글일경우는 원글제목 가져오기
		String subject="";
		if(num>0) {
			subject=service.getData(num).getSubject();
		}
		model.addAttribute("subject", subject);
		
		return "/reboard/addForm";
	}
	
	@PostMapping("/insert")
	public ModelAndView insert(@ModelAttribute ReboardDto dto,
			List<MultipartFile> multi,
			HttpSession session) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("redirect:content");
		
		String photo="";
		
		if(!multi.get(0).getOriginalFilename().equals("")) {
			String path=session.getServletContext().getRealPath("/rephoto");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			for(MultipartFile m:multi) {
				String fName=m.getOriginalFilename();
				String photoname=sdf.format(new Date())+"_"+fName;
				
				try {
					m.transferTo(new File(path+"\\"+photoname));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				photo+=photoname+",";
			}
			photo=photo.substring(0, photo.length()-1);
		}
		dto.setPhoto(photo);
		service.insertReboard(dto);
		
		int num=service.getMaxNum();
		model.addObject("num", num);
		
		return model;
	}
	
	@GetMapping("/content")
	public String content(Model model,@RequestParam int num,@RequestParam(defaultValue = "1") int currentPage) {
		
		//service.updateViewCount(num);
		
		ReboardDto dto=service.getData(num);
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "/reboard/content";
	}
	
	@GetMapping("/likes")
	public @ResponseBody Map<String, Integer> uplikes(int num) {
		service.updateLikes(num);
		int likes=service.getData(num).getLikes();
		
		Map<String, Integer> map=new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
}
