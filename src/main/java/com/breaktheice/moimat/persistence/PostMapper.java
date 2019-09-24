package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.PostDomain;

public interface PostMapper {
	
	// 조회수 증가
	public int viewCount(PostDomain domain);
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
	
	// 게시물 작성자 확인 member_seq 를 int 형으로 반환
	public int memberCheck(PostDomain domain);
}
