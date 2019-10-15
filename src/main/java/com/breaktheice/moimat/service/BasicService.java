 package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.BasicDomain;
import com.breaktheice.moimat.page.Criteria;

public interface BasicService {
	
	public BasicDomain selectBoardOne(long postId);
	public List<BasicDomain> selectBoardList();
	public long insertBoard(BasicDomain domain);
	public long deleteBoard(BasicDomain domain);
	public long modifyBoard(BasicDomain domain);
	
	public List<BasicDomain> selectReplyList(BasicDomain domain);
	
	public long replyUPBoard(BasicDomain domain);
	public long replyBoard(BasicDomain domain);
	public long replydeleteBoard(BasicDomain domain);
	
	public long updateViewCnt(BasicDomain domain);

	
	public long selectAllBoard() throws Exception;
	
	  public List<BasicDomain> selectBoardListPage(Criteria criteria) throws Exception;
	

}
