package com.breaktheice.moimat.domain;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private Long memId;
	private String memEmail;
	private String memPassword;
	private String memNickName;
	private String memBirthDay;
	private char memGender;
	private String memArea;
	private Date memRegDate;
	private Date memUpdate;
	private Date memLastLogin;
	private String memContent;
	private String memPhoto;
	private int memLevel;
	private int memStatus;
	private int memInt1;
	private int memInt2;
	private int memInt3;
}
