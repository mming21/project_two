/*
  package edu.spring.multi;
  
  import org.springframework.beans.factory.annotation.Autowired; import
  org.springframework.stereotype.Controller; import
  org.springframework.web.bind.annotation.RequestMapping; import
  org.springframework.web.servlet.ModelAndView;
  
  import annotation.service.member.MemberService;
  
  @Controller public class MemberServiceController {
  
  @Autowired MemberService service;
  
  @RequestMapping("/memberservice") 
  ModelAndView getMemberService(annotation.service.member.MemberVO vo) { 
  ModelAndView mv = new ModelAndView(); 
  String login = service.login(vo); 
  String register =service.register(vo); 
  mv.addObject("loginresult", login);
  mv.addObject("registerresult", register);
  mv.setViewName("member/memberservice"); return mv; }
  
  }
  
*/ 