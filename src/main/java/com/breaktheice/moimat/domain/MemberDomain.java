package com.breaktheice.moimat.domain;

import lombok.Data;

@Data
public class MemberDomain {

	private Long memId;
	private String memEmail;
	private String memPassword;
	private String memNickname;
	private String memBirthday;
	private String memGender;
	private Long areaId;
	private String memRegdate;
	private String memUpdate;
	private String memLastlogin;
	private String memContent;
	private String memPhoto;
	private Long memLevel;
	private Long memStatus;
	private Long memInt1;
	private Long memInt2;
	private Long memInt3;
	
	//to use keyProperty
	public void setMemberDomain(MemberDomain md) {
		this.memId = md.memId;
		this.memEmail = md.memEmail;
		this.memPassword = md.memPassword;
		this.memNickname = md.memNickname;
		this.memBirthday = md.memBirthday;
		this.memGender = md.memGender;
		this.areaId = md.areaId;
		this.memRegdate = md.memRegdate;
		this.memUpdate = md.memUpdate;
		this.memLastlogin = md.memLastlogin;
		this.memContent = md.memContent;
		this.memPhoto = md.memPhoto;
		this.memLevel = md.memLevel;
		this.memStatus = md.memStatus;
		this.memInt1 = md.memInt1;
		this.memInt2 = md.memInt2;
		this.memInt3 = md.memInt3;
	}
	
}