package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemBoardDto;
import boot.data.service.MemBoardService;

@Controller
@RequestMapping("/memboard")
public class MemBoardController {
	
	@Autowired
	MemBoardService service;

	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/memboard/memList");
		
		int totalcount=service.getTotalCount();
		
		model.addObject("totalcount", totalcount);
		
		//페이징처리에 필요한 변수선언
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수
		
		totalPage=totalcount/perPage+(totalcount%perPage==0?0:1);

		startPage=(currentPage-1)/perBlock*perBlock+1;
		     
		endPage=startPage+perBlock-1;
 
		 if(endPage>totalPage)
			 endPage=totalPage;

		startNum=(currentPage-1)*perPage;
		int printNum=totalcount-startNum;
		
		List<MemBoardDto> list=service.getList(startNum, perPage);
		
		model.addObject("list", list);
		model.addObject("currentPage", currentPage);
		model.addObject("totalpage", totalPage);
		model.addObject("startpage", startPage);
		model.addObject("endpage", endPage);
		model.addObject("startnum", startNum);
		model.addObject("perpage", perPage);
		model.addObject("perblock", perBlock);
		model.addObject("printnum", printNum);
		
		return model;
	}
	
	@GetMapping("/form")
	public String form() {
		return "/memboard/addForm";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemBoardDto dto,HttpSession session) {
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String path=session.getServletContext().getRealPath("/savefile");
		String uploadfile=sdf.format(new Date())+"_"+dto.getMulti().getOriginalFilename();
		
		if(dto.getMulti().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else {
			try {
				dto.getMulti().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setUploadfile(uploadfile);
		}
		dto.setMyid((String)session.getAttribute("myid"));
		dto.setName((String)session.getAttribute("loginname"));
		
		service.insertBoard(dto);
		
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String num,int currentPage) {
		
		ModelAndView model=new ModelAndView();
		model.setViewName("/memboard/content");

		service.updateviewcount(num);
		
		MemBoardDto dto=service.getData(num);
		
		model.addObject("dto", dto);
		
		//업로드파일의 확장자 얻기
		int dotloc=dto.getUploadfile().lastIndexOf("."); //마지막 점의 위치
		String ext=dto.getUploadfile().substring(dotloc+1);
		//System.out.println(dotloc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg")||ext.equalsIgnoreCase("gif")||
			ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpeg"))
			model.addObject("bupload", true);

		model.addObject("currentPage", currentPage);
		
		return model;
	}
}
