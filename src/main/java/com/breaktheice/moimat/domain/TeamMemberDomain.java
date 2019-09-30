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
	private int teamLevel;//role
	private String tmemContent;
	private String tmemNickName;
	private String tmemEmail;
	private Date tmemLastVisit;
	private Date tmemRegDate;
	private String tmemBirthDay;// 이거 캘린더에 추가해야겟당 ㅎㅎ(기억용)
	private char tmemGender;
	private String tmemPhoto;
	
}
