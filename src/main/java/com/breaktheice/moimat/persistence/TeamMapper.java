package com.breaktheice.moimat.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.breaktheice.moimat.domain.AdminVO;
import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface TeamMapper {

	//for indexpage
	List<TeamDomain> getRandomList();
	List<TeamDomain> getIntRandomList(Long intId);
	List<TeamDomain> getAreaRandomList(Long areaId);
	
	// 전체 모임 수 
	public Long totalCount(AdminCriteria cri);
	
	
	// 모임 목록
	public List<TeamDomain> list(AdminCriteria cri);
	// 모임 상세
	public TeamDomain view(TeamDomain domain);
	// 모임 추가
	public Long add(TeamDomain domain);
	// 모임 등록시 모임장으로 추가
	public Long addGroupMaster(HashMap<String , Object> map);
	public Long getTeamid(TeamDomain domain);
	
	// 모임 수정
	public Long update(TeamDomain domain);
	// 모임 삭제
	public Long remove(TeamDomain domain);
	
	// 선택한 관심사
	public String getInterest(TeamDomain domain);
	// 선택한 관심지역
	public String getArea(TeamDomain domain);
	public AreaDomain getAreaAll(TeamDomain domain);
	// 선택한 작성자의 닉네임
	public String getNickname(TeamDomain domain);
	
	// 관심지역
	public List<AreaDomain> selectAllAreas();
	// 관심사
	public List<InterestDomain> selectAllInterest();

	List<TeamDomain> selectJoinedGroupList(Long memId);

	TeamDomain selectTeamInfo(Long teamId);

	// 전체 관심사 카운트
	public List<AdminVO> interestCount();
	// 전체 지역 카운트
	public List<AdminVO> areaCount();
	
	// 최근 7일간 등록된 모임
	public List<TeamDomain> recentOneWeek(AdminCriteria cri);
	// 풀네임필요
	public String getAreaFullName(TeamDomain teamDomain);
	
	public Long countTeamMember(TeamDomain teamDomain);
	
	public List<TeamPostDomain> getPostDomain(@Param("teamId")Long teamId,@Param("brdId")Long brdId,@Param("rowNum")Long rowNum);
	
}
