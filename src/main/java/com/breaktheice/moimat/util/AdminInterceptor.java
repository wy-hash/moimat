package com.breaktheice.moimat.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.breaktheice.moimat.domain.MemberDomain;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);
	
		if (session != null && session.getAttribute("loginVO") != null) {
			MemberDomain admin = (MemberDomain) session.getAttribute("loginVO");
			if (admin != null && admin.getMemLevel() != null && admin.getMemLevel() >=8L) {
				return true;
			}
		}

	
		response.sendRedirect("/home");
		
		return false;
	}
	

}
