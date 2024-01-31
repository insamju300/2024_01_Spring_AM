package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.handler.NeedLoginInterceptor;
import com.example.handler.NeedLogoutInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(new NeedLoginInterceptor())
		.addPathPatterns("/usr/article/doWrite", "/usr/article/doModify", "/usr/article/doDelete", "/usr/member/doLogout");
		
		registry.addInterceptor(new NeedLogoutInterceptor())
		.addPathPatterns("/usr/member/doJoin", "/usr/member/doLogin");
	}
	

	
}
