package study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudyController {	
	
	@Autowired
	@Qualifier("studyservice")
	StudyService studyservice;
	
	//메모 저장
	@RequestMapping(value = "/savestudy", method = RequestMethod.POST)
	public ModelAndView saveStudy(StudyInfoVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		studyservice.saveStudy(vo);
		mv.addObject("result", vo);
		mv.setViewName("/test/test2"); 
		return mv;
	}
	
	@RequestMapping(value="/studylist")
	@ResponseBody
	public ModelAndView studyList(HttpSession session) {
		List<StudyInfoVO> list = studyservice.studyList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("studylist", list);
		mv.setViewName("/test/test1");
		return mv;
	}
	
//	@RequestMapping("productlist")
//	@ResponseBody
//	public ModelAndView productList() {
//		List<ProductVO> list = service.productList();
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("productlist", list);
//		mv.setViewName("productlist");	
//		return mv;
//	}


}
