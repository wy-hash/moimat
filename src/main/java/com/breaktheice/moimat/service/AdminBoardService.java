package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.BoardDomain;

public interface AdminBoardService {
	
	public List<BoardDomain> list();				// 게시판 코드 목록
	public BoardDomain view(BoardDomain domain);	// 게시판 코드 상세보기
	public Long add(BoardDomain domain);				// 게시판 코드 추가
	public Long update(BoardDomain domain);			// 게시판 코드 수정
	public Long remove(BoardDomain domain);			// 게시판 코드 삭제
	public boolean keyCheck(BoardDomain domain);	// 게시판 코드 중복 체크
}
