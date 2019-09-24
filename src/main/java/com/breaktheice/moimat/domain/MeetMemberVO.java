package com.breaktheice.moimat.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetMemberVO {
	private Long mmemId; //meetMemberId (meet_member_seq)
	private Long meetId; //meetId(MeetDomain)
	private Long tmemId; // teamMemberID
	private String mmemNickName;// meetMemberNickName
	private String mmemEmail;// meetMemberEmail
}
