package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamVO;

public interface TeamSettingsMapper {
	public TeamVO getTeamInfo(Long teamId);
	
	public int updateTeamInfo(TeamVO teamVO);
	
	public int teamBreakUp(Long teamId);
	//일단은 냅둠(쿼리 안만듬)
	/*======== 지역 ========*/
	public AreaDomain getArea(TeamVO teamVO);
	//or Long areaID 근데 TeamVO가 편할거같아서 일단 해놓음
	//선택된 상태 구하기 
	public String selectedMainArea(TeamVO teamVO);
	
	public List<AreaDomain> getAreaKey();
	//선택창 대분류에 이용
	public List<AreaDomain> getAreaRegionKey(String areakey);
	//String areaKey 소분류 선택창 범위에 이용  AreaKey선택시 호출하는 쿼리
	/*======== 지역 ========*/
	/*======== 관심사 ========*/
	public InterestDomain getInt(TeamVO teamVO);
	//or Long intId 위와 마찬가지(주요관심사 목록으로 필요함
	public String selectedMainInterest(TeamVO teamVO);
	
	public List<InterestDomain> getMainInterest();
	//대분류 목록 따로 가져오기
	public List<InterestDomain> getSubInterest(String intkey);
	//소분류 목록 따로 가져오기 여기서 intId를 가져와야함(대분류 선택시 호출되는 쿼리)
	/*======== 관심사 ========*/
	public MemberDomain getMember(TeamVO teamVO);
	//or Long memId ...(모임 생성한사람 정보) 필요없을거 같음!
	
}
