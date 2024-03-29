package com.breaktheice.moimat.domain;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MeetListVO {
	private List<MeetVO> meetList;
	private Map<Long,Integer> countMeetMember;
	private Map<Long,Boolean> isAttend;
	private Map<Long,Boolean> isWriter;
	private int meetCount;
}
