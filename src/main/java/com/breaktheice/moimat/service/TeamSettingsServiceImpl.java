package com.breaktheice.moimat.service;

import java.util.List;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamSettingsPageVO;
import com.breaktheice.moimat.domain.TeamVO;
import com.breaktheice.moimat.persistence.TeamSettingsMapper;

@Service
@Log4j
public class TeamSettingsServiceImpl implements TeamSettingsService{

	@Autowired
	private TeamSettingsMapper tsm;
	
	@Override
	public TeamSettingsPageVO getSettingPage(Long teamId) {
		TeamVO teamVO = tsm.getTeamInfo(teamId);
		AreaDomain areaDomain = tsm.getArea(teamVO);
		InterestDomain intDomain = tsm.getInt(teamVO);
		List<AreaDomain> areaKey = tsm.getAreaKey();
		String selectedArea = tsm.selectedMainArea(teamVO);
		List<AreaDomain> areaRegionKey = tsm.getAreaRegionKey(areaDomain.getAreaKey());
		String selectedMainInt = tsm.selectedMainInterest(teamVO);
		List<InterestDomain> mainInterest = tsm.getMainInterest();
		List<InterestDomain> subInterest = tsm.getSubInterest(selectedMainInt);
		TeamSettingsPageVO tsp = new TeamSettingsPageVO(teamVO, areaDomain, intDomain, selectedArea, areaKey, areaRegionKey, selectedMainInt, mainInterest, subInterest);
		
		return tsp;
	}

	@Override
	public TeamSettingsPageVO getSettingBasic() {
		List<AreaDomain> areaKey = tsm.getAreaKey();
		List<InterestDomain> mainInterest = tsm.getMainInterest();
		TeamSettingsPageVO tsp = new TeamSettingsPageVO(null, null, null, null, areaKey, null, null, mainInterest, null);
		
		return tsp;
	}
	@Override
	public List<AreaDomain> getRegionArea(String areakey) {
		return tsm.getAreaRegionKey(areakey);
	}

	@Override
	public List<InterestDomain> getSubInterest(String intkey) {
		// TODO Auto-generated method stub
		return tsm.getSubInterest(intkey);
	}

	@Override
	public int updateTeamInfo(TeamVO teamVO) {
		// TODO Auto-generated method stub
		int result = tsm.updateTeamInfo(teamVO);
		log.info(result);
		return result;
	}

	@Override
	public TeamVO getTeamInfo(Long teamId) {
		return tsm.getTeamInfo(teamId);
	}
	
	

}
