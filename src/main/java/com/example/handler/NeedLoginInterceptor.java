package com.example.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Integer id = (Integer)request.getSession().getAttribute("loginedMemberId");
		System.out.println(id);
		if(id==null) {
		    response.sendRedirect("/usr/err/showNeedLoginError");
		    return false;
		}
		return true;
	}

}
