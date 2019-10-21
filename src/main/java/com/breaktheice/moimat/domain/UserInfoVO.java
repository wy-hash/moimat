package com.breaktheice.moimat.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class UserInfoVO {
	// 유저 정보 (개인)
	private MemberDomain memberDomain;
	// 유저 참여 team
	private List<TeamVO> teamDomain;
	// 유저 작성 글 List
	private List<PostDomain> postDomain;
	// 관심사 3개
	private Map<Long,String> intMap;
	
	private Map<Long,String> areaMap;
	// 지역 명
	private String areaName;
}
