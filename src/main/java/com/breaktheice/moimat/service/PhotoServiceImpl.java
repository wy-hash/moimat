package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PhotoDomain;
import com.breaktheice.moimat.persistence.PhotoMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class PhotoServiceImpl implements PhotoService{

	private PhotoMapper mapper;

	@Override
	public List<PhotoDomain> selectBoardList() {
		
		return mapper.selectBoardList();
	}
	
	public PhotoDomain selectBoardOne(String seq) {
		
		
		return mapper.selectBoardOne(seq);		
	}
	public void insertBoard(PhotoDomain domain) {
		
		
		mapper.insertBoard(domain);
	}
	// 사진첩 게시물 삭제
	public void deleteBoard(PhotoDomain domain) {
		
		//mapper.delete파일();
		//mapper.delete참조테이블(); -- 
		mapper.deleteBoard(domain);
	}
	//사진첩 게시물 수정
	public void modifyBoard(PhotoDomain domain) {
		
		
		mapper.modifyBoard(domain);
	}
	public void replyUPBoard(PhotoDomain domain) {
		
		mapper.replyUPBoard(domain);
		
	}

	public void replyBoard(PhotoDomain domain) {
		
		mapper.replyBoard(domain);
		
	}

	
}
