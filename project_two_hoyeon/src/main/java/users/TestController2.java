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
public class TestController2 {
	@Autowired
	@Qualifier("userservice")
	UsersService service;
//	@Autowired
//	SqlSession session;
	
	@RequestMapping("/studylist")
	@ResponseBody
	public ModelAndView resultlist(String title, String member_id) {
		ModelAndView mv = new ModelAndView();
		StudyInfoVO vo = new StudyInfoVO();
		List<StudyInfoVO> userslist = service.UsersList();
		List<StudyInfoVO> studyinfolist = service.StudyinfoList();
		vo.setTitle(title);
		vo.setMember_id(member_id);
//		System.out.println(studyinfolist);
		//mv.addObject("userstitle", title);
		mv.addObject("studyinfolist", studyinfolist);
		mv.setViewName("/list/studylist");
		return mv;
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchtitle(StudyInfoVO vo) {
		ModelAndView mv = new ModelAndView();
//		System.out.println(word);
//		List<UsersVO> searchlist = service.getWord(word);
		String member_id = vo.getMember_id();
		String title = vo.getTitle();
		List<StudyInfoVO> searchlist = service.getWord(title, member_id);
		System.out.println(searchlist);
		try {
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
	public void boardDelete(@RequestParam(name="title1", required=false)List title) {
		if(title==null) {
			System.out.println("Error");
		}
		else {
		for(int i=0; i < title.size(); i++) {
			service.boardDelete((String)(title.get(i)));
		}
		}
	}
	@RequestMapping(value="/delete2")
	@ResponseBody
	public void boardDelete1(@RequestParam(name="title2", required=false) List title) {
		if(title==null) {
			System.out.println("Error");
		}
		else {
		for(int i=0; i < title.size(); i++) {
			service.boardDelete((String)(title.get(i)));
		}
		}
	}
	
	
	
}
