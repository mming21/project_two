package project.two.shadow;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	
	
	
	  ///////////파일을 DB에서 가져와야함///////////
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/prjtts/**")
		.addResourceLocations("file:///C:\\Users\\knifejo\\Desktop\\프로젝트\\text파일/");
		
		
	}

}
