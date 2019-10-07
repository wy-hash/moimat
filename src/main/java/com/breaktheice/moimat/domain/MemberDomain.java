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
	private Long areaId = 0L;
	private String memRegdate;
	private String memUpdate;
	private String memLastlogin;
	private String memContent;
	private String memPhoto;
	private Long memLevel = 0L;
	private Long memStatus = 0L;
	private Long memInt1 = 0L;
	private Long memInt2 = 0L;
	private Long memInt3 = 0L;
	
	
	
}
