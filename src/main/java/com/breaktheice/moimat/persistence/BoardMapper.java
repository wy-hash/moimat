package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.BoardDomain;

public interface BoardMapper {
	public List<BoardDomain> list();				// 게시판 코드 목록
	public BoardDomain view(BoardDomain domain);	// 게시판 코드 상세보기
	public Long add(BoardDomain domain);			// 게시판 코드 추가하기
	public Long update(BoardDomain domain);			// 게시판 코드 수정하기
	public Long remove(BoardDomain domain);			// 게시판 코드 삭제하기
	public Long keyCheck(BoardDomain domain);		// 게시판 코드 중복체크
}
