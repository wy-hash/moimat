package com.breaktheice.moimat.domain;

import java.util.List;

import lombok.Data;

@Data
public class GroupMemberVO{
	List<Long> tmemIds;
	String teamName;
	Long memberId;
	int tmemLevel;
	Long teamId;
}
