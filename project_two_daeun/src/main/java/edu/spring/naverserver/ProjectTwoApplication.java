package edu.spring.naverserver;

import org.mybatis.spring.annotation.MapperScan;  
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import contents.ContentsVO;
import contents.ContentsController;
import contents.ContentsDAO;


@SpringBootApplication
@ComponentScan(basePackageClasses = ContentsVO.class)
@ComponentScan(basePackageClasses = ContentsController.class)
@ComponentScan
@MapperScan(basePackageClasses = ContentsDAO.class)
public class ProjectTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTwoApplication.class, args);
		System.out.println("9003포트 실행성공");
	}

}
