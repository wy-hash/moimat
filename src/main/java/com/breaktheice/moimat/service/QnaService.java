package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface QnaService {

	// 마이페이지 개인 질문 
	public List<PostDomain> myqnaList(AdminCriteria cri, Long memId);
	// 게시글 전체 개수
	public Long myqnaTotalCount(AdminCriteria cri, Long memId);
	
	// 게시글 상세
	public PostDomain view(PostDomain domain);
	// 게시글 추가
	public Long add(PostDomain domain);
	// 게시글 조회수 증가
	public Long viewCount(PostDomain domain);
}
