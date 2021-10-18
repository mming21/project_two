package tts;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectTtsController {

	@Autowired
	ProjectTtsService ttsservice;
	/*
	@RequestMapping(value="/ttsinput",method=RequestMethod.GET)
	public String ttsinput(String op) {
		System.out.println(op);
		return op;
	}
	
	*/
	
	
	@RequestMapping("/ttsinput")
	public ModelAndView ttsinput() throws IOException {
		
	
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/tts/ttsinput");
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/ttsinput", method=RequestMethod.POST)
	public ModelAndView ttsoutput(String out, double speed) throws IOException  { //String text
		ModelAndView mv= new ModelAndView();
		
		System.out.println(out);
		String mp3file="";
		mp3file=ttsservice.main(out,speed);
		System.out.println(mp3file);
		mv.addObject("ttsoutput",mp3file);
		mv.addObject("out",out);
		mv.setViewName("/tts/ttsinput");
		return mv;
		
		/*
		String mp3file="";
		mp3file=ttsservice.main(text);
		//System.out.println(mp3file);
		mv.addObject("ttsoutput",mp3file);
		mv.setViewName("/tts/ttsoutput");
		return mv;
		*/
	}
	
	
	
}
