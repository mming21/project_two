package project.two.shadow;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import users.TestController;
import users.UsersDAO;
@SpringBootApplication
@MapperScan(basePackageClasses = UsersDAO.class)
@ComponentScan(basePackageClasses = TestController.class)
public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("project start!");
	}

}
