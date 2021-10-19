package tts;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class ProjectTtsService {

	// public static void main(String[] args) throws IOException 
	 public String main(String id, double speed) throws IOException {
		 String tempname="";
		 String clientId = "l14nl9846c";//애플리케이션 클라이언트 아이디값";
	     String clientSecret = "VVeGuwAlvJztUI99JWgHVbeqbwkOmtQEcve3Umd3";//애플리케이션 클라이언트 시크릿값";

	    // String str = Files.readString(Paths.get("C:\\Users\\knifejo\\Desktop\\프로젝트\\text파일/test.txt"));
	     // System.out.println(str);
	     
	     try {
	    	 
	         String text = URLEncoder.encode(id, "UTF-8"); //
	         //System.out.println(text);
	         //text="";
	         
	         /*String textfile = "C:/Users/knifejo/Desktop/프로젝트/text파일/"+file;
	         FileReader fr = new FileReader(textfile);
	         Scanner sfr = new Scanner(fr);
	         while(sfr.hasNextLine()==true) {
	        	 text += sfr.nextLine();
	         }
	         System.out.println(text);
	         text = URLEncoder.encode(text,"utf-8");
	         */
	         
	         
	         
	         
	         String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
	         URL url = new URL(apiURL);
	         HttpURLConnection con = (HttpURLConnection)url.openConnection();
	         con.setRequestMethod("POST");
	         con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
	         con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
	         // post request
	         String postParams = "speaker=nara&volume=0&speed="+speed+"&pitch=0&format=mp3&text=" + text;
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
	             //String tempname = Long.valueOf(new Date().getTime()).toString();  
	             //업로드된 파일을 어떻게 가져오지????????????????
	             //날짜로 파일명
	            
	            SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	           
	            tempname=sf.format(new Date());
	            
	             //tempname = "test";
	             
	             File f = new File("C:/Users/JS/Desktop/" + tempname + ".mp3");
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
	     System.out.println(tempname+".mp3");
	     return tempname+".mp3";
	     
	 }
	}