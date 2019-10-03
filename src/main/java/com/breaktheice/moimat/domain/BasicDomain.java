package com.breaktheice.moimat.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BasicDomain {
	
	//team post테이블
	private int postId;
	private int teamId;
	private int brdId;
	private String postTitle;
	private String postContent;
	private int tmemId;
	private int postTmemLevel;
	private String postNickname;
	private String postEmail;
	private Timestamp postRegdate;
	private Timestamp postUpdate;
	private int postHit;

	
		
		
}
