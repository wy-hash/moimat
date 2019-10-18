package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamSettingsPageVO;
import com.breaktheice.moimat.domain.TeamVO;

public interface TeamSettingsService {
	
	public TeamSettingsPageVO getSettingPage(Long teamId);
	
	public List<InterestDomain> getSubInterest(String intkey);
	
	public List<AreaDomain> getRegionArea(String areakey);
	
	public int updateTeamInfo(TeamVO teamVO);

}
