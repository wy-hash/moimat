package com.breaktheice.moimat.domain;

import lombok.Data;

@Data
public class MemberDomain {

	private int memId;
	private String memEmail;
	private String memPassword;
	private String memNickname;
	private String memBirthday;
	private String memGender;
	private String memArea;
	private String memRegdate;
	private String memDate;
	private String memLastlogin;
	private String memContent;
	private String memPhoto;
	private int memLevel;
	private int memStatus;
	private int memInt1;
	private int memInt2;
	private int memInt3;
}
