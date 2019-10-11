package com.breaktheice.moimat.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BasicDomain {
	
	//team post테이블
	private long postId;
	private long teamId;
	private long brdId;
	private String postTitle;
	private String postContent;
	private long tmemId;
	private long postTmemLevel;
	private String postNickname;
	private String postEmail;
	private Timestamp postRegdate;
	private Timestamp postUpdate;
	private long postHit;
	
	//team_comments 댓글 테이블
	private long cmtId;
	private String cmtContent;
	private String cmtNickname;
	private String cmtEmail;
	private Timestamp cmtRegdate;
	private Timestamp cmtUpdate;
	 

	
		
		
}
