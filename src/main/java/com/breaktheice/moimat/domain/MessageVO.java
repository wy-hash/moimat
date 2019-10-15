package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	private Long msgId; //Primary key
	private Long sendMemId; //메세지 발신 회원의 Primary key
	private Long recvMemId; //메세지 수신 회원의 Primary key
	private String msgTitle; //메세지 제목
	private String msgContent; //메세지 내용
	private Date msgRegdate; //메세지 발신 일자
	private Date msgReaddate; //메세지 읽은 읽자
}
