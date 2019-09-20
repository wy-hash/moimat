package com.breaktheice.moimat.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PhotoDomain {
	
	//post테이블
		private int seq;
		private int postTypeSeq;
		private String title;
		private String content;
		private Timestamp regdate;
		
		private int orgin;
		private int priority;
		private int depth;
		//post_leply테이블
		private int memberSeq;
		private String talk;
		//파일업로드 테이블
		private String fullname;
		private int postSeq;
}
