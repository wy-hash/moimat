package com.breaktheice.moimat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AdminVO;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.persistence.MemberMapper;
import com.breaktheice.moimat.persistence.PostMapper;
import com.breaktheice.moimat.persistence.TeamMapper;
import com.breaktheice.moimat.util.AdminCriteria;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired PostMapper postMapper;
	@Autowired MemberMapper memberMapper;
	@Autowired TeamMapper teamMapper;
	
	@Override
	public List<PostDomain> getQuestion() {
		// 답변 안한 게시글
		AdminCriteria cri = new AdminCriteria();
		cri.setKeyword("Q");
		
		return postMapper.list(cri);
	}

	@Override
	public Long memberCount() {
		// 모임앳 가입자 수
		memberMapper.totalCount(new AdminCriteria());
		return null;
	}

	@Override
	public List<AdminVO> memberInterest() {
		// 사용자들이 가장 선택을 많이 한 관심사 5순위 까지
		return memberMapper.interestCount();
	}

	@Override
	public List<AdminVO> memberArea() {
		// 사용자들이 가장 선택을 많이 한 활동지역 5순위 까지
		return memberMapper.areaCount();
	}

	@Override
	public List<AdminVO> groupInterest() {
		// 전체 모임에서 가장 선택을 많이한 관심사  5순위 까지
		return teamMapper.interestCount();
	}

	@Override
	public List<AdminVO> groupArea() {
		// 전체 모임에서 가장 선택을 많이한 활동지역  5순위 까지
		return teamMapper.areaCount();
	}

	@Override
	public List<AdminVO> memberRegdateCount() {
		// 사용자의 등록일 기준 카운트
		return memberMapper.regdateCount();
	}

}
