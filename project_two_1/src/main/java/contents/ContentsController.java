package contents;

import java.io.File; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {
	
	@Autowired
	ContentsServiceImpl contentsservice;
	
	//http://localhost:9003/contentsinput
	@RequestMapping("/contentsinput")
	public ModelAndView contentsinput() {
		System.out.println("컨트롤러");
		//이미지파일 리스트 모델 생성 - 뷰 전달
		//C:\Users\USER\Desktop\images  폴더 파일명 리스트 
		File f = new File("C:/Users/USER/Desktop/IMAGE");
		String[] namelist = f.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("filelist", namelist);
		mv.setViewName("/cont/contentsinput");
		return mv;
		
		List<ContentsVO> title = contentsservice.contentsOne(content_title);
		ModelAndView mv2 = new ModelAndView();
		mv.addObject("titleresult", title);
		mv.setViewName("cont/contentsinput");
		return mv2;
		
	}
	@RequestMapping("/contents")
	public ModelAndView contents(String speaker) {
		System.out.println("시작");
		List<ContentsVO> list = contentsservice.contentsList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("contresult", list);
		mv.setViewName("cont/contents");
		return mv;

	}
	
}
