package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.PhotoDomain;

public interface PhotoService {
	
	public PhotoDomain selectBoardOne(String seq);
	public List<PhotoDomain> selectBoardList();
	public void insertBoard(PhotoDomain domain);
	public void deleteBoard(PhotoDomain domain);
	public void modifyBoard(PhotoDomain domain);
	public void replyUPBoard(PhotoDomain domain);
	public void replyBoard(PhotoDomain domain);	
	
	

}
