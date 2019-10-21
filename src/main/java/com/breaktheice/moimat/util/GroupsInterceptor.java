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
public class GroupsInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired TeamMapper teamMapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);

		log.info("URL 테스트 : "+request.getHeader("referer"));
		log.info("HOST 테스트 : "+request.getHeader("host"));
		String host = request.getHeader("host");
		String prevURL = request.getHeader("referer");
		String[] arr =  new String[2];
		
		if (prevURL !=null && host!= null) {
			arr = prevURL.split(host);
		}

	
		if (session != null && session.getAttribute("loginVO") != null) {
			MemberDomain user = (MemberDomain) session.getAttribute("loginVO");//로그인한 유저
			
			if (user != null && user.getMemId() != null) {
				List<TeamDomain> groupList = teamMapper.selectJoinedGroupList(user.getMemId());
				
				for (TeamDomain domain : groupList) {
					if((arr[1]+"/").contains("/"+domain.getTeamId()+"/"))// uri 주소의 그룹번호가 회원이 가입한 팀번호와 일치하다
						return true;
				}
			}
		}
		//홈만볼수있음 , 
		//설정은 운영진까지.
		if (arr[1] != null) {
			response.sendRedirect(arr[1]);
			
		} else {
			response.sendRedirect("/groups");
		}
		
		return false;
	}
	

}
