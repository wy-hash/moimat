package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamVO;

public interface TeamSettingsMapper {
	public TeamVO getTeamInfo(Long teamId);
	
	public int setTeamInfo(TeamVO teamVO);
	
	public int teamBreakUp(Long teamId);
	//일단은 냅둠(쿼리 안만듬)
	/*======== 지역 ========*/
	public AreaDomain getArea(TeamVO teamVO);
	//or Long areaID 근데 TeamVO가 편할거같아서 일단 해놓음
	public List<AreaDomain> getAreaList();
	//설정 변경시 필요 
	public Long getAreaId(AreaDomain areaDomain);
	//String areaKey String areaRegionKey 
	public List<AreaDomain> getAreaKey();
	//
	public List<AreaDomain> getAreaRegionKey(AreaDomain areaDomain);
	//String areaKey
	/*======== 지역 ========*/
	/*======== 관심사 ========*/
	public InterestDomain getInt(TeamVO teamVO);
	//or Long intId 위와 마찬가지(주요관심사 목록으로 필요함
	public List<InterestDomain> getIntList();
	//설정 변경시 필요
	public Long getIntId(InterestDomain intrestDomain);
	//대분류와 소분류를 통해 구해야 할 경우 
	public List<InterestDomain> getMainInterest();
	//대분류 목록 따로 가져오기
	public List<InterestDomain> getSubInterest(String intKey);
	//소분류 목록 따로 가져오기 여기서 intId를 가져와야함
	/*======== 관심사 ========*/
	public MemberDomain getMember(TeamVO teamVO);
	//or Long memId ...(모임 생성한사람 정보) 필요없을거 같음!
	
}
