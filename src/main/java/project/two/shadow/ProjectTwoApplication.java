package project.two.shadow;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import tts.ProjectTtsController;
import tts.ProjectTtsService;

@ComponentScan(basePackageClasses=TextInputController.class)
@ComponentScan(basePackageClasses=ProjectTtsController.class)
@ComponentScan(basePackageClasses=ProjectTtsService.class)

@SpringBootApplication
public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("projecttwo실행");
	}

}
