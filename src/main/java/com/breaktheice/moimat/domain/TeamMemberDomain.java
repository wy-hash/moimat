package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamMemberDomain {
	private Long tmemId;//teamMemberId
	private Long teamId;//teamId;
	private Long memId;//memberId;
	private Long tmemLevel;//role
	private String tmemContent;
	private String tmemNickName;
	private String tmemEmail;
	private Date tmemLastVisit;
	private Date tmemRegDate;
	private String tmemBirthDay;// 
	private String tmemGender;
	private String tmemPhoto;
	
}
