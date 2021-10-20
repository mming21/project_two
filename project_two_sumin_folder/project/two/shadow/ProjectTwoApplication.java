package project.two.shadow;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import member.MemberController;
import member.MemberDAO;
import member.MemberDAOImpl;
import security.AccountRunner;



@SpringBootApplication
@ComponentScan
@ComponentScan(basePackageClasses = MemberController.class)

//@ComponentScan(basePackageClasses = AccountRunner.class)

@MapperScan(basePackageClasses = MemberDAOImpl.class)

public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("정상 가동 중");
	}

}
