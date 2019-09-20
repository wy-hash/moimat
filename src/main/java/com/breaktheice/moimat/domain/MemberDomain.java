package com.breaktheice.moimat.domain;

import lombok.Data;

@Data 
public class MemberDomain {
	
	private String id;
	private String password;
	private String name;
	private String birthday;
	private String email;
}
