package com.breaktheice.moimat.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.TeamMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class MypageInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired TeamMapper teamMapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		

		log.info("URL 테스트 : "+request.getHeader("referer"));
		log.info("HOST 테스트 : "+request.getHeader("host"));
		String host = request.getHeader("host");
		String prevURL = request.getHeader("referer");
		String[] arr =  new String[2];
		
		if (prevURL !=null && host!= null) {
			arr = prevURL.split(host);
		}

		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("loginVO") != null) {
			if(prevURL == null) {
				response.sendRedirect("/mypage/usercheck");

				return false;
			}
			
			return true;
		}
		
		response.sendRedirect("/auth/login");
		
		return false;
	}
	

}
