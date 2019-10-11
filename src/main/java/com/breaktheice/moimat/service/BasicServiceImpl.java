 package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.BasicDomain;
import com.breaktheice.moimat.page.Criteria;
import com.breaktheice.moimat.persistence.BasicMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class BasicServiceImpl implements BasicService{
	
	private BasicMapper mapper;
	
//페이징
	  public List<BasicDomain> selectBoardListPage(Criteria criteria) throws Exception {
			return mapper.selectBoardListPage(criteria);
	    }
	
	
	public int selectAllBoard() throws Exception {
		
		return mapper.selectAllBoard();
    }
	public void updateViewCnt(BasicDomain domain) {
		
		mapper.updateViewCnt(domain);
	}


	//게시물 리스트
	public List<BasicDomain> selectBoardList() {
	
		return mapper.selectBoardList();
	}
	public List<BasicDomain> selectReplyList(BasicDomain domain){
		
		return mapper.selectReplyList(domain);
	}
	
	//게시물 상세보기
	public BasicDomain selectBoardOne(long postId) {
		
		return mapper.selectBoardOne(postId);
	}


	//게시물 생성
	public void insertBoard(BasicDomain domain) {
		mapper.insertBoard(domain);
	}
	//게시물 삭제
	public void deleteBoard(BasicDomain domain) {
		
		// 덧글이 있는지 확인
//		select count(*) from team_comments where post_id = 28;
		//
		mapper.deleteBoardComment(domain);
		mapper.deleteBoard(domain);
	}
	//게시물수정
	public void modifyBoard(BasicDomain domain) {
		mapper.modifyBoard(domain);
	}
	//댓글 생성
	public void replyBoard(BasicDomain domain) {
		
		mapper.replyBoard(domain);
		}
	//댓글 수정
	public void replyUPBoard(BasicDomain domain) {
		
		mapper.replyUPBoard(domain);
		
	}
	//댓글삭제
	public void replydeleteBoard(BasicDomain domain) {
	
		mapper.replydeleteBoard(domain);
//		mapper.replydeleteBoard2(domain);
	}

}
