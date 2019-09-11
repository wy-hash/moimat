package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private Long seq; //유저번호
	private String id; //유저아이디
	private String password; //비밀번호
	private String name;//유저이름
	private Date birthday; //생년월일
	private String email; //유저 이메일
	private String area; //지역
	private String phone_number; //전화번호
	private char state; //상태
	private Date regDate; //등록일
	private Date updateDate; //수정일
	private String photo; //사진

}
