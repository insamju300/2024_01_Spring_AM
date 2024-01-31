package com.example.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLogoutInterceptor implements HandlerInterceptor{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Integer id = (Integer)request.getSession().getAttribute("loginedMemberId");
		if(id!=null) {
		    response.sendRedirect("/usr/err/showNeedLogoutError");
		    return false;
		}
		return true;
	}

}
