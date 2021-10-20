package service;

import java.util.ArrayList;

import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController2 {
	@RequestMapping("/memberlist")
	ModelAndView getMeberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		list.add(new MemberVO("member1", 1111, "김회원", "kim@mul.com"));
		list.add(new MemberVO("member2", 1111, "박대한", "kim@mul.com"));
		list.add(new MemberVO("member3", 1111, "김민국", "kim@mul.com"));
		list.add(new MemberVO("member4", 1111, "홍길동", "kim@mul.com"));
		list.add(new MemberVO("member5", 1111, "최회원", "kim@mul.com"));
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberlist", list);//모델의 이름, 모델 객체 
		mv.setViewName("member/memberlist");
		//ViewResolver api가 알아서 해주기에 확장자나 생성자 같은거 내가 만들필요 없음.
		return mv;

	}
	
	//요청 - 아이디 암호 이름 이메일 입력 form view 응답
	//입력 - 서버요청 - 확인 결과 view
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	//url에 insert라는 값이 입력되었을 때
	//method 안써주면 get/post둘다 되는 거고 써주면 그 방식만.
	String memberForm() {
		return "member/insertform";
		//member폴더의 insert form이라는 뜻
	}
	
	//method가 get/post로 나누어지면 같은 value값이라도 따로 나눠지기 때문에 가능함. 원래는 같은 값 못 줌. url중복 불가.
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	//method가 있으면 value 값도 써줘야함. 
	ModelAndView memberProcess(MemberVO vo) {
		//= vo.setMemberid(request.getParameter("memberid")); 및 ~email까지 자동으로 호출되는 것.setter 자동 호출 효과
		ModelAndView mv = new ModelAndView();
		if(!vo.getMember_id().equals("spring")) {//spring이란 아이디는 이미 존재한다고 생각할 때
			mv.addObject("result", "정상 회원 가입가능합니다.");
		}else {
			mv.addObject("result", "아이디 중복입니다. 다른 아이디 입력하세요.");
		}
		mv.setViewName("member/insertprocess");
		return mv;
	}

}
