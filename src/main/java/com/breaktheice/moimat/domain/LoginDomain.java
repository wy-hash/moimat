package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data 
public class LoginDomain {
	String memId; // mem_id
	String memEmail;
	String memPassword;
	String memNickname;
	String memBirthday;
	String memGender;
	String memArea;
	String memUpdate;
	String memPhoto;
	String memLevel;
	String memInt1;
	String memInt2;
	String memInt3;
	
}
