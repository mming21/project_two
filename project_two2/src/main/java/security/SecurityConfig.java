package security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
      .authorizeRequests() // 인증이 필요한 모든 요청에 대해
        .antMatchers("/", "/hello").permitAll() // "/", "/hello" 는 인증정보 필요 없음.
        .anyRequest().authenticated() // 그 외 모든 요청은 인증정보 필요함.
        .and()
      .formLogin() // formLogin 사용할 거임.
        .and()
      .httpBasic(); // httpBasic 도 사용할 거임.
  }
  
  @Bean
  public PasswordEncoder passwordEncoder() {
    return PasswordEncoderFactories.createDelegatingPasswordEncoder();
  }
}
