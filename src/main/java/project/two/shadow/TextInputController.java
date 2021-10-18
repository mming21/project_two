package project.two.shadow;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TextInputController {
	@RequestMapping("/textinput")
	public ModelAndView textinput() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("textinput");
		mv.setViewName("textinput");
		
		return mv;
		
	}

	
	
}
