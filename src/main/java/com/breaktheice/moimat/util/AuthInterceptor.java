package com.breaktheice.moimat.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.breaktheice.moimat.domain.MemberDomain;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("loginVO") != null) {
			
			return true;
		}
		
		response.sendRedirect("/auth/login");
		
		return false;
	}
	

}
