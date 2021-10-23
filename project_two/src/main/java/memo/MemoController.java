package memo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/memolist")
	@ResponseBody
	public ModelAndView memoList(String id, String num) {
		List<MemoVO> list = service.memoList(id, num);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", list);
		mv.setViewName("/test/test2");
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
