package project.two.shadow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import stt.STTController;
import totalservice.TotalServiceController;
import translation.PapagoController;
import tts.ProjectTtsController;
import upload.UploadController;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackageClasses = STTController.class)
@ComponentScan(basePackageClasses = UploadController.class)
@ComponentScan(basePackageClasses = PapagoController.class)
@ComponentScan(basePackageClasses = ProjectTtsController.class)
@ComponentScan(basePackageClasses = TotalServiceController.class)
public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("project_two실행(port:9007)");
	}

}
