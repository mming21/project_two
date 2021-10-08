package project.two.shadow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import stt.SpeechController;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackageClasses = SpeechController.class)
public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("project_two실행");
	}

}
