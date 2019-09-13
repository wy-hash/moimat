package com.breaktheice.moimat.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetingPageVO {
	private MeetVO meetVO;
	private List<MeetMemberVO> memberList;
	private boolean isAttend;
}
