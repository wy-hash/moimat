 package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.BasicDomain;
import com.breaktheice.moimat.page.Criteria;

public interface BasicService {
	
	public BasicDomain selectBoardOne(int postId);
	public List<BasicDomain> selectBoardList();
	public void insertBoard(BasicDomain domain);
	public void deleteBoard(BasicDomain domain);
	public void modifyBoard(BasicDomain domain);
	
	
	public void replyUPBoard(BasicDomain domain);
	public void replyBoard(BasicDomain domain);
	public void replydeleteBoard(BasicDomain domain);
	
	

	//파일업로드
	public int selectAllBoard() throws Exception;
	
	  public List<BasicDomain> selectBoardListPage(Criteria criteria) throws Exception;
	

}
