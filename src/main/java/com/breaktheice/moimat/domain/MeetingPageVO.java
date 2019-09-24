package com.breaktheice.moimat.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class MeetingPageVO {
	private MeetDomain meetDomain;
	private List<MemberDomain> memberList;
	private boolean isAttend;
}
