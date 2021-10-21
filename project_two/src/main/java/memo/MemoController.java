package memo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemoController {	
	
	@Autowired
	@Qualifier("memoservice")
	MemoService service;
	
	//메모 저장
	@RequestMapping(value = "/savememo", method = RequestMethod.POST)
	public ModelAndView saveMemo(MemoVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		service.saveMemo(vo);
		mv.addObject("result", vo);
		mv.setViewName("/test/test2"); 
		return mv;
	}
	
	@RequestMapping(value="/deletememo")
	public ModelAndView deleteMemo(MemoVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/test/test2"); 
		return mv;
	}

}
