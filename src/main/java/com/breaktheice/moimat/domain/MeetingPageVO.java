package com.breaktheice.moimat.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MeetingPageVO {
	private MeetVO meetDomain;
	private List<MeetMemberVO> memberList;
	private boolean isAttend;
}
