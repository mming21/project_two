package users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@Autowired
	@Qualifier("service")
	UsersService service;
//	@Autowired
//	SqlSession session;
	
	@RequestMapping("/studylist")
	@ResponseBody
	public ModelAndView resultlist(String title, String member_id) {
		ModelAndView mv = new ModelAndView();
		UsersVO vo = new UsersVO();
		List<UsersVO> userslist = service.UsersList();
		List<UsersVO> studyinfolist = service.StudyinfoList();
		vo.setTitle(title);
		vo.setMember_id(member_id);
		System.out.println(studyinfolist);
		//mv.addObject("userstitle", title);
		mv.addObject("studyinfolist", studyinfolist);
		mv.setViewName("/list/studylist");
		return mv;
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchtitle(@RequestParam("word") String word, String title) {
		ModelAndView mv = new ModelAndView();
		UsersVO vo = new UsersVO();
//		System.out.println(word);
//		List<UsersVO> searchlist = service.getWord(word);
//		System.out.println(searchlist);
		List<UsersVO> searchlist = service.getWord(word);
//		System.out.println(searchlist);
		vo.setTitle(title);
		try {
			System.out.println("Searching word :");
			mv.addObject("searchlist", searchlist);
			mv.setViewName("/list/studylist2");
		}
		catch(Exception e){
			System.out.println("error!");
		}
		return mv;
	}
	@RequestMapping(value="/delete")
	@ResponseBody
	public void boardDelete(@RequestParam("delete") List delete) {
		for(int i=0; i < delete.size(); i++) {
			service.boardDelete((String)(delete.get(i)));
		}
//		System.out.println(delete.get(0));
//		return "/list/studylist";
	}
	
}
