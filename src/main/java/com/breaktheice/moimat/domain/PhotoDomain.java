package com.breaktheice.moimat.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PhotoDomain {
	
	private int seq;
	private int post_type_seq;
	private String title;
	private String content;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int count;
	private int membereq;
	private int orgin;
	private int priority;
	private int depth;

}
