package totalservice;

import java.io.IOException;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import stt.STTService;
import tts.TTSService;

@Controller
public class TotalServiceController {
	
	@RequestMapping("service")
	public String serviceForm() {
		return "/total/total";
	}
//	
//	@RequestMapping(value="/service2", method=RequestMethod.POST)
//	@ResponseBody
//	public String ttsoutput(String input, int speed) throws IOException{ //String text
//		String mp3file = ttsservice.test(input, speed);
//		System.out.println(mp3file);
//		return mp3file;
//	}

	
//	//upload파일 저장 후 파일명 전달
//    @RequestMapping("/serviceuploadresult")
//    @ResponseBody
//    public String uploadResult(MultipartFile file1) throws IOException{ //MultipartFile객체를 사용해 jsp에서 받은 파일을 전송받는다.
//    	
//		String filename1 = file1.getOriginalFilename(); //전송받은 파일명 얻기
//		String savepath = "C:/Users/JS/Desktop/";
//		File serverfile1 = new File(savepath + filename1);//파일객체 생성
//		file1.transferTo(serverfile1);//원하는위치에 파일 생성
//		return filename1; //확장자포함 파일명 얻고싶은 경우
//		//확장자 뺀 파일명만 얻고 싶은경우
////		String[] fileResult = filename1.split("[.]");
////		System.out.println(fileResult[0]);
////		return fileResult[0]; 
//    }
//    
//    //sttservice 결과 출력
//    @RequestMapping("/servicesttservice")
//    @ResponseBody
//    public String sttService(String file) {    	
//    	String response = sttservice.test(file); //test함수 결과는 {"text":"결과"} 형태로 출력된다.    	
//		JSONObject obj = new JSONObject(response);
//		String text = (String)obj.get("text");
//		System.out.println(text);    	
//    	return response;
//    }  
	
}
