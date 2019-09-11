package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetVO {
	private Long seq; //번호
	private Long teamSeq; //모임 번호
	private String area; //지역
	private Date meetDate; //만나는날
	private Date regDate; //등록일
	private Date updateDate; //수정일
	private int maxPerson; //모임 최대인원
	private Long memberSeq; // 정모 개설자 id
	private String title;
	private String content;
	private String payment;
}
