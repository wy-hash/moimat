package com.breaktheice.moimat.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetMemberDomain {
	private Long mmemId; //meetMemberId
	private Long meetId; //meetId(MeetDomain)
	private Long tmemId; // teamMemberID
	private String mmemNickName;// meetMemberNickName
	private String mmemEmail;// meetMemberEmail
}
