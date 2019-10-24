package com.breaktheice.moimat.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;


@Data
public class TeamInfoVO {
		// 유저 참여 team
		private List<TeamVO> teamDomain;
		// 유저 작성 글 List
		private List<TeamPostDomain> postList;
		
		private List<TeamPostDomain> postPhotoList;
		// 관심사 3개
		private String interest;
		
		private String area;
		
		private Long countMember;
}
