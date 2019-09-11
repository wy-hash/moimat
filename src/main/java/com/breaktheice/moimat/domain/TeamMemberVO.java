package com.breaktheice.moimat.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamMemberVO {
	private Long team_seq; //모임번호
	private Long member_seq; //유저번호
	private Long role_seq; //역할번호  role table의 seq와
}
