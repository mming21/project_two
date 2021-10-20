package tts;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectTtsController {

	@Autowired
	ProjectTtsService ttsservice;
	
	/*
	 * @Autowired TTSService ttsservice2;
	 * 
	 * @RequestMapping("tts2") public String ttsinput2() { return
	 * ("/tts/ttsinput2"); }
	 * 
	 * @RequestMapping("/ttsservice")
	 * 
	 * @ResponseStatus public String ttsinput3(String out) { String mp3file = "";
	 * mp3file = ttsservice2.test(out); System.out.println(mp3file); return mp3file;
	 * }
	 */	
	
	@RequestMapping("/ttsinput")
	public ModelAndView ttsinput() throws IOException {	
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/total/total");
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
		mv.setViewName("/total/total");
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