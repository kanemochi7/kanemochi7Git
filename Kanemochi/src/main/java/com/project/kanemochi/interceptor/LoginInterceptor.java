package com.project.kanemochi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginID");
		System.out.println(id);
		if(id == null) {
			System.out.println("id 없다구.");
			response.sendRedirect("/kanemochi");
			return false;
		}
		else{
			System.out.println("id : "+id);
			return true;
		}
		
	}
}








