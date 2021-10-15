package upload;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
//<context>cpn... base=p..="upload"
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	
    
    @RequestMapping("/upload")
    public String form()
    {
        return "/upload/upload";
    }
    
    @RequestMapping("/result")
    @ResponseBody
    public String result(MultipartFile file1) throws IOException{ //MultipartFile객체를 사용해 jsp에서 받은 파일을 전송받는다.
    	
		String filename1 = file1.getOriginalFilename(); //전송받은 파일명 얻기
		String savepath = "C:/Users/JS/Desktop/";
		File serverfile1 = new File(savepath + filename1);//파일객체 생성
		file1.transferTo(serverfile1);//원하는위치에 파일 생성
		return filename1;
    }
    
//	@RequestMapping(value="/ajaxfileupload", method=RequestMethod.POST)
//	@ResponseBody
//	public String ajaxuploadResult(MultipartFile file1) throws IOException{
//		//파일명 추출
//		String filename1 = file1.getOriginalFilename();
//		//서버 폴더 설정
//		String savePath = "C:/kdigital2/0_javaclass/images/";
//		//저장
//		File serverfile1 = new File(savePath + filename1);
//		file1.transferTo(serverfile1);
//	
//		return filename1+" 파일 잘 받았습니다.";
//
//	}//uploadResult end
    
//    public String result(@RequestParam("file1") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model)
//    {
//        String url = null;
//        
//        try {
// 
//            //String uploadpath = request.getServletContext().getRealPath(path);
//            String uploadpath = path;
//            String originFilename = multi.getOriginalFilename();
//            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
//            long size = multi.getSize();
//            String saveFileName = genSaveFileName(extName);
//            
//            System.out.println("uploadpath : " + uploadpath);
//            
//            System.out.println("originFilename : " + originFilename);
//            System.out.println("extensionName : " + extName);
//            System.out.println("size : " + size);
//            System.out.println("saveFileName : " + saveFileName);
//            
//            if(!multi.isEmpty())
//            {
//                File file = new File(uploadpath, multi.getOriginalFilename());
//                multi.transferTo(file);
//                
//                model.addAttribute("filename", multi.getOriginalFilename());
//                model.addAttribute("uploadPath", file.getAbsolutePath());
//                
//                return "filelist";
//            }
//        }catch(Exception e)
//        {
//            System.out.println(e);
//        }
//        return "redirect:upload";
//    }
//    
//    // 현재 시간을 기준으로 파일 이름 생성
//    private String genSaveFileName(String extName) {
//        String fileName = "";
//        
//        Calendar calendar = Calendar.getInstance();
//        fileName += calendar.get(Calendar.YEAR);
//        fileName += calendar.get(Calendar.MONTH);
//        fileName += calendar.get(Calendar.DATE);
//        fileName += calendar.get(Calendar.HOUR);
//        fileName += calendar.get(Calendar.MINUTE);
//        fileName += calendar.get(Calendar.SECOND);
//        fileName += calendar.get(Calendar.MILLISECOND);
//        fileName += extName;
//        
//        return fileName;
//    }
	
	@RequestMapping(value="/fileupload", method=RequestMethod.GET)
	public String uploadForm() {
		return "/upload/uploadform";//file1 이름으로 1개 파일 전송
	}
	
//	@RequestMapping(value="/upload", method=RequestMethod.GET)
//	public String upload() {
//		return "/upload/upload";//file1 이름으로 1개 파일 전송
//	}
	
	@RequestMapping(value="/fileupload", method=RequestMethod.POST)
	@ResponseBody
	public String uploadResult(MultipartFile file1) throws IOException{
		//파일명 추출
		String filename1 = file1.getOriginalFilename();
		//서버 폴더 설정
		String savePath = "C:/kdigital2/0_javaclass/images/";
		//저장
		File serverfile1 = new File(savePath + filename1);
		file1.transferTo(serverfile1);
	
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("clientfilename", filename1);
//		mv.setViewName("/upload/uploadresult");
		return filename1 + " 업로드 완료";
	}//uploadResult end
	
	@RequestMapping(value="/ajaxfileupload", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxuploadResult(MultipartFile file1) throws IOException{
		//파일명 추출
		String filename1 = file1.getOriginalFilename();
		//서버 폴더 설정
		String savePath = "C:/kdigital2/0_javaclass/images/";
		//저장
		File serverfile1 = new File(savePath + filename1);
		file1.transferTo(serverfile1);
	
		return filename1+" 파일 잘 받았습니다.";

	}//uploadResult end
	
}
