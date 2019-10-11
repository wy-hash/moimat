package com.breaktheice.moimat.domain;

import java.util.HashMap;
import java.util.List;

import lombok.Data;

@Data
public class TeamMemberListVO {
	
	private List<TeamMemberDomain> getMember;
	
	private HashMap<Integer,String> grade;
	
}
