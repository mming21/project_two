package project.two.shadow;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import member.MemberController;
import member.MemberDAOImpl;
import stt.STTController;
import study.StudyController;
import study.StudyDAOImpl;
import totalservice.TotalServiceController;
import translation.PapagoController;
import tts.TTSController;
import upload.UploadController;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackageClasses = STTController.class)
@ComponentScan(basePackageClasses = UploadController.class)
@ComponentScan(basePackageClasses = PapagoController.class)
@ComponentScan(basePackageClasses = TTSController.class)
@ComponentScan(basePackageClasses = TotalServiceController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@ComponentScan(basePackageClasses = StudyController.class)

@MapperScan(basePackageClasses = MemberDAOImpl.class)
@MapperScan(basePackageClasses = StudyDAOImpl.class)
public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("project_two실행(port:9007)");
	}

}
