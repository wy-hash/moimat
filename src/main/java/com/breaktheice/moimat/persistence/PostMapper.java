package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface PostMapper {
	
	// 게시글 전체 개수
	public Long totalCount(AdminCriteria cri);
	
	// 조회수 증가
	public Long viewCount(PostDomain domain);
	// 게시글 목록
	public List<PostDomain> list(AdminCriteria cri);
	// 게시글 상세
	public PostDomain view(PostDomain domain);
	// 게시글 추가
	public Long add(PostDomain domain);
	// 답글 추가
	public Long reply(PostDomain domain);
	// 게시글 수정
	public Long update(PostDomain domain);
	// 게시글 삭제
	public Long remove(PostDomain domain);
	
	// 게시글 작성자 확인 mem_id 를 Long 형으로 반환
	public Long memberCheck(PostDomain domain);
}
