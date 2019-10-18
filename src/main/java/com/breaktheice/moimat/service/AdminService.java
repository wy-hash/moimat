package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.AdminVO;
import com.breaktheice.moimat.domain.PostDomain;

public interface AdminService {
	
	public List<PostDomain> getQuestion(); 						// 답변 안한 게시글		
	public Long memberCount();									// 모임앳 총 이용자 수
	public List<AdminVO> memberRegdateCount();						// 가입일에 따른 가입자 수 최근 
	public List<AdminVO> memberInterest(); 					// 사용자들이 가장 선택을 많이 한 관심사 5순위 까지  
	public List<AdminVO> memberArea(); 						// 사용자들이 가장 선택을 많이 한 활동지역 5순위 까지
	public List<AdminVO> groupInterest();					// 전체 모임에서 가장 선택을 많이한 관심사  5순위 까지
	public List<AdminVO> groupArea();						// 전체 모임에서 가장 선택을 많이한 활동지역  5순위 까지

}
