package tts;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import org.springframework.stereotype.Service;

import project.two.shadow.NaverService;

//import edu.spring.naverai.NaverService;

@Service
public class NaverVoiceService implements NaverService  { //implements NaverService

	
	public String test(String file) {
		return test(file, "mijin");
		
	}///test(String file) end
	// 메소드추가
	
	public String test(String file, String speaker) {
		 String tempname="";
		 String clientId = "1ha8ur3dox";//애플리케이션 클라이언트 아이디값";
	     String clientSecret = "jp0VCunkagZpYP8S9esAMFJIYQxnA5NtX17ft61A";//애플리케이션 클라이언트 시크릿값";

	     try {
	    	 
	    	  ///////////파일을 DB에서 가져와야함///////////
	    	 
	         String text = URLEncoder.encode("오늘부터는 파이널 프로젝트 기획 준비를 할 시간입니다", "UTF-8"); // 13자
	         text="";
	         String textfile = "C:/Users/knifejo/Desktop/images/"+file;
	         FileReader fr = new FileReader(textfile);
	         Scanner sfr = new Scanner(fr);
	         while(sfr.hasNextLine()==true) {
	        	 text += sfr.nextLine();
	         }
	         System.out.println(text);
	         text = URLEncoder.encode(text,"utf-8");
	         
	         //FileReader(텍스트), FileInputStream(바이너리)
	         //FileWriter(텍스트) -stt(텍스트를 파일로 저장),
	         //FileOutputStream(텍스트를 음성으로 변환 바이너리 파일로 저장)
	         
	         String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
	         URL url = new URL(apiURL);
	         HttpURLConnection con = (HttpURLConnection)url.openConnection();
	         con.setRequestMethod("POST");
	         con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
	         con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
	         // post request
	         String postParams = "speaker=" +speaker+ "&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
	         con.setDoOutput(true);
	         DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	         wr.writeBytes(postParams);
	         wr.flush();
	         wr.close();
	         int responseCode = con.getResponseCode();
	         BufferedReader br;
	         if(responseCode==200) { // 정상 호출
	             InputStream is = con.getInputStream();
	             int read = 0;
	             byte[] bytes = new byte[1024];
	             // 랜덤한 이름으로 mp3 파일 생성
	              
	             
	             
	             SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	             tempname = sf.format(new Date());
	             
	             ///////////파일을 DB에서 가져와야함///////////
	             
	             File f = new File("C:\\Users\\knifejo\\Desktop\\images/" + tempname + ".mp3");
	             f.createNewFile();
	             OutputStream outputStream = new FileOutputStream(f);
	             while ((read =is.read(bytes)) != -1) {
	                 outputStream.write(bytes, 0, read);
	             }
	             is.close();
	         } else {  // 오류 발생
	             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	             String inputLine;
	             StringBuffer response = new StringBuffer();
	             while ((inputLine = br.readLine()) != null) {
	                 response.append(inputLine);
	             }
	             br.close();
	             System.out.println(response.toString());
	         }
	     } catch (Exception e) {
	         System.out.println(e);
	     }
	     return tempname+".mp3";
	 }

	        
	}



