package com.breaktheice.moimat.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatDomain {
	
	//SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE
	int seq;
	int memberSeq;
	int teamSeq;
	String content;
	Date regdate;
	
	
}
