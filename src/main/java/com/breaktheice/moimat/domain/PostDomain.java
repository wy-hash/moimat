package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PostDomain {
	
//	SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE,
//  COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH -- post Table
//  name -- member table

	private int seq;
	private int postTypeSeq;
	private String title;
	private String content;
	private String regdate;
	private String updatedate;
	private int count;
	private int memberSeq;
	private int orgin;
	private int priority;
	private int depth;
	
	private String name; //작성자

}
