package egovframework.sample.service.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import egovframework.sample.service.security.PasswordEncoder;
import egovframework.sample.service.security.PasswordGenerator;

@Configuration
public class SecurityConfig{
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new PasswordEncoder();
		}
	
	@Bean
	public PasswordGenerator passwordGenerator() {
		return new PasswordGenerator();
	}
	
}