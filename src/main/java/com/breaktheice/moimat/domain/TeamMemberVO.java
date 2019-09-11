package com.breaktheice.moimat.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamMemberVO {
	private Long teamSeq; //모임번호
	private Long memberSeq; //유저번호
	private Long roleSeq; //역할번호  role table의 seq와
}
