package users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
		//vo.setTitle(title);
		//vo.setMember_id(member_id);
		System.out.println(studyinfolist);
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
//		System.out.println(searchlist);
		List<StudyInfoVO> searchlist = service.getWord(vo);
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
	/*
	@RequestMapping(value="/delete")
	@ResponseBody
	public void boardDelete(@RequestParam("title") List title) {
		for(int i=0; i < title.size(); i++) {
			service.boardDelete((String)(title.get(i)));
		}
//		System.out.println(delete.get(0));
//		return "/list/studylist";
	}*/
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	@ResponseBody
	public void boardDelete(@RequestParam(name="title1", required=false)List title, HttpServletResponse response) throws IOException {
		for(int i=0; i < title.size(); i++) {
			service.boardDelete((String)(title.get(i)));
		}
		//service.boardDelete((String)(title.get(i)));
		/*if(title==null) {
			System.out.println("Error");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('Error : Check title first!') ");
			out.println("history.back()");
			out.println("location.reload(true)");
			out.println("</script> ");
			out.close();
		}
		else {
		for(int i=0; i < title.size(); i++) {
			service.boardDelete((String)(title.get(i)));
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("confirm('Sure to delete?')");
			out.println("history.back()");
			out.println("window.location.reload(true)");
			out.println("</script>");
		}
		}*/
	}
	
	
	@RequestMapping(value="/delete2", method=RequestMethod.GET)
	@ResponseBody
	public void boardDelete1(@RequestParam(name="title2", required=false ) List title, HttpServletResponse response) throws IOException {
		if(title==null) {
			System.out.println("Error");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('Error : Check title first!') ");
			out.println("history.back()");
			out.println("</script> ");
			out.close();
		}
		else {
		for(int i=0; i < title.size(); i++) {
			service.boardDelete((String)(title.get(i)));
		}
		}
	}
	
	
}
