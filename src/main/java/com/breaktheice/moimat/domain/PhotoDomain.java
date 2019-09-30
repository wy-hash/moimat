package com.breaktheice.moimat.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PhotoDomain {
	
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
	private int hit;
	
		//파일업로드 테이블
		private int pfiId;
		private String pfiOriginname;
		private Timestamp pfiRegdate;                   
		
		//TEAM_COMMENTS 테이블
		private int	CMT_ID;
		private int POST_ID;
		private int BRD_ID;
		private String CMT_CONTENT;
		private int TMEM_ID;
		private String CMT_NICKNAME;
		private String CMT_EMAIL;
		Timestamp CMT_REGDATE;
		Timestamp CMT_UPDATE;
		
		
}
