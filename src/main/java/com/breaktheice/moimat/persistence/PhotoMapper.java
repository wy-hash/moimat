package com.breaktheice.moimat.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.breaktheice.moimat.domain.PhotoDomain;

public interface PhotoMapper {

	public PhotoDomain selectBoardOne(@Param("seq")String seq);
	public List<PhotoDomain> selectBoardList();
	public void insertBoard(PhotoDomain domain);
	public void deleteBoard(PhotoDomain domain);
	public void modifyBoard(PhotoDomain domain);
	public void replyUPBoard(PhotoDomain domain);
	public void replyBoard(PhotoDomain domain);	
	 
	
	
}
