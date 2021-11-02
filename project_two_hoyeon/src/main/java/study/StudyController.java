package study;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.MemberVO;

@Controller
public class StudyController {	
	
	@Autowired
	@Qualifier("studyservice")
	StudyService studyservice;
	
	@RequestMapping("study")
	public String studyall() {
		return "/study/service_css";
	}
	
	//메모 저장
	@RequestMapping(value = "/savestudy", method = RequestMethod.POST)
	public ModelAndView saveStudy(StudyInfoVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		studyservice.saveStudy(vo);
		mv.addObject("result", vo);
		mv.setViewName("/study/service_css"); 
		return mv;
	}
	
	//제목누르면 글쓰기 페이지로 이동
	/*
	@RequestMapping(value = "/gotoStudy", method = RequestMethod.GET)
	public ModelAndView gotoStudy(@ModelAttribute StudyInfoVO vo, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StudyInfoVO> list = studyservice.studyList2(vo);
		mv.addObject("result", list);
		mv.setViewName("/study/aboutstudy"); 
		return mv;
	}*/
	
	//제목누르면 글쓰기 페이지로 이동
		@RequestMapping(value = "/gotoStudy", method = RequestMethod.GET)
		public ModelAndView gotoStudy(String title, HttpSession session) throws Exception{
			System.out.println(title);
			String member_id = (String)session.getAttribute("id");//리턴타입이 object라서 형변환 필요
			ModelAndView mv = new ModelAndView();
			List<StudyInfoVO> list = studyservice.studyList2(title, member_id);
			mv.addObject("result", list);
			mv.setViewName("/study/aboutstudy"); 
			return mv;
		}
	
	//메모내용 수정
	@RequestMapping(value = "/updatestudy", method = RequestMethod.POST)
	@ResponseBody
	public String saveStudy2(StudyInfoVO vo) throws Exception{;
		studyservice.updateStudy(vo); 
		String updatemsg="upadate success";
		return updatemsg;
	}
	
	//제목 눌렀을 때 저장된 내용 나오는 메모페이지
	@RequestMapping(value="/aboutstudy", method = RequestMethod.GET)
	public String AboutStudy() {
		return "/study/aboutstudy";

	}

	
	

}
