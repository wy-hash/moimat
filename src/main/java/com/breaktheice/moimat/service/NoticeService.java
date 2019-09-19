package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostDomain;

@Service
public interface NoticeService {

	
	// 게시물 목록
	public List<PostDomain> list(PostDomain domain);
	// 게시물 상세
	public PostDomain view(PostDomain domain);
	// 게시물 추가
	public int add(PostDomain domain);
	// 게시물 수정
	public int update(PostDomain domain);
	// 게시물 삭제
	public int remove(PostDomain domain);
	

}
