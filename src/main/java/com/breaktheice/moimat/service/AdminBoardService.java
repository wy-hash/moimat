package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.BoardDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface AdminBoardService {
	public Long totalCount(AdminCriteria cri);			// 게시판 코드 전체 개수
	public List<BoardDomain> listAll();					// 게시판 코드 목록 (전체)
	public List<BoardDomain> list(AdminCriteria cri);	// 게시판 코드 목록
	public BoardDomain view(BoardDomain domain);		// 게시판 코드 상세보기
	public Long add(BoardDomain domain);				// 게시판 코드 추가
	public Long update(BoardDomain domain);				// 게시판 코드 수정
	public Long remove(BoardDomain domain);				// 게시판 코드 삭제
	public boolean keyCheck(BoardDomain domain);		// 게시판 코드 중복 체크
}
