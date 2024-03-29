package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface AdminTeamService {

	//for indexpage
	List<TeamDomain> getRandomList();
	
	// 전체 모임 수 
	public Long totalCount(AdminCriteria cri);
	
	// 모임 목록
	public List<TeamDomain> list(AdminCriteria cri);
	// 모임 상세
	public TeamDomain view(TeamDomain domain);
	// 모임 추가
	public Long add(TeamDomain domain, MemberDomain member);
	// 모임 수정
	public Long update(TeamDomain domain);
	// 모임 삭제
	public Long remove(TeamDomain domain);
	
	// 선택한 관심사
	public String getInterest(TeamDomain domain);
	// 선택한 관심지역
	public String getArea(TeamDomain domain);
	// 선택한 작성자의 닉네임
	public String getNickname(TeamDomain domain);
	// 관심지역
	public List<AreaDomain> selectAllAreas();
	// 관심사
	public List<InterestDomain> selectAllInterest();
	// 최근 7일간 등록된 모임
	public List<TeamDomain> recentOneWeek(AdminCriteria cri);
	
}
