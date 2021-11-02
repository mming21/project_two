package users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController2 {
	@Autowired
	@Qualifier("userservice")
	UsersService service;
	
	@RequestMapping("/studylist")
	public ModelAndView resultlist(String title, String member_id, HttpServletRequest request, @RequestParam(name="admin_id") String admin_id) {
		ModelAndView mv = new ModelAndView();
		StudyInfoVO vo = new StudyInfoVO();
		HttpSession session = request.getSession();
		String current_id = (String)session.getAttribute("id");
//		List<StudyInfoVO> userslist = service.UsersList();
		List<StudyInfoVO> studyinfolist = service.StudyinfoList(current_id);
//		System.out.println(current_id);
//		System.out.println(studyinfolistall);
		if (current_id.equals("admin")) {
			List<StudyInfoVO> studyinfolistall = service.StudyinfoList(admin_id);
			mv.addObject("studyinfolistall", studyinfolistall);
			mv.addObject("admin_id", admin_id);
			mv.setViewName("/list/studylistadmin");
		}
		else {
			vo.setTitle(title);
			vo.setMember_id(member_id);
			mv.addObject("studyinfolist", studyinfolist);
			mv.setViewName("/list/studylist");
		}
		return mv;
	}
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView searchtitle(StudyInfoVO vo) {
		ModelAndView mv = new ModelAndView();
		String member_id = vo.getMember_id();
		String title = vo.getTitle();
		title = "%"+title+"%";
		List<StudyInfoVO> searchlist = service.getWord(title, member_id);
//		System.out.println(searchlist);
		try {
			mv.addObject("searchlist", searchlist);
			mv.setViewName("/list/studylist2");
		}
		catch(Exception e){
			System.out.println("error!");
		}
		return mv;
	}
	@RequestMapping(value="/searchadmin", method=RequestMethod.POST)
	public ModelAndView searchtitle2(StudyInfoVO vo) {
		ModelAndView mv = new ModelAndView();
		String member_id = vo.getMember_id();
		String title = vo.getTitle();
		title = "%"+title+"%";
		List<StudyInfoVO> searchlist = service.getWord(title, member_id);
//		System.out.println(searchlist);
		try {
			mv.addObject("searchlist", searchlist);
			mv.setViewName("/list/studylist2");
		}
		catch(Exception e){
			System.out.println("error!");
		}
		return mv;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void boardDelete(@RequestParam(name="title1", required=false)List title, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(title==null) {
			System.out.println("Error");
			out.println("<script>alert('Error : Check title first!') ");
			out.println("history.back()");
			out.println("location.reload()");
			out.println("</script> ");
			out.close();
		}
		else {
		for(int i=0; i < title.size(); i++) {
			out.println("<script>");
			out.println("confirm('Sure to delete?')");
			service.boardDelete((String)(title.get(i)));
			out.println("window.location.replace('/studylist')");
			out.println("</script>");
			out.close();
		}
		}
	}
	
	
	@RequestMapping(value="/delete2", method=RequestMethod.GET)
	public void boardDelete1(@RequestParam(name="title2", required=false ) List title, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(title==null) {
			System.out.println("Error");
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
	
	
	

