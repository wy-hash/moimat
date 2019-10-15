package com.breaktheice.moimat.domain;


import java.util.Date;

import lombok.Data;

@Data
public class MeetVO {
	private Long meetId; //정모 번호
	private Long teamId; //모임 번호
	private String meetTitle;//정모 제목
	private String meetContent;//정모 내용
	private Date meetDate;//정모 모임날자
	private Date meetRegDate;//정모 등록날자
	private int meetMax;//정모 최대인원
	private String meetPay;//정모 회비
	private Long tmemId;//작성자 (team memberId)
	private String meetNickName;//작성자 별명 (고민)
	private String meetEmail;//작성자 이메일 (사용안함)
	private String meetArea;
	private String meetPhoto;
}
