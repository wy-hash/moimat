package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.TeamVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( "file:src/main/webapp/WEB-INF/spring/root-context.xml" )
@Log4j
public class TeamSettingsMapperTests {
	
	@Autowired
	private TeamSettingsMapper tsm;
	
	@Autowired
	private UserMapper um;
	
	@Test
	public void getUserInfo() {
		um.getUserInfo(83L);
		um.getAreaName(17L);
	}
	
	
	@Test
	public void getTeamInfoTest() {
		log.info(tsm.getTeamInfo(1L).getTeamContent());
	}
	
	@Test
	public void setTeamInfoTest() {
		TeamVO teamVO = tsm.getTeamInfo(1L);
		teamVO.setTeamMax(20L); // team_max가 해당 수치로 변화해야함
		teamVO.setMemId(3L); // setMemId 해도 DB는 변화 없어야함
		log.info("결과~!@!@#!@#~!@!@#!@#"+tsm.updateTeamInfo(teamVO));
	}
	
	@Test
	public void getAreaTest() {
		TeamVO teamVO = tsm.getTeamInfo(1L);
		tsm.getArea(teamVO);
	}
	
	
	@Test
	public void getIntTest() {
		TeamVO teamVO = tsm.getTeamInfo(1L);
		tsm.getInt(teamVO);
	}
	
	@Test
	public void getMemeberTest() {
		TeamVO teamVO = tsm.getTeamInfo(1L);
		tsm.getMember(teamVO);
	}
	
	@Test
	public void getAreaRegionKeyTest() {
		TeamVO teamVO = tsm.getTeamInfo(1L);
		AreaDomain areaDomain = tsm.getArea(teamVO);
		tsm.getAreaRegionKey(areaDomain.getAreaKey());
	}
	
	
	@Test
	public void getAreaKey() {
		tsm.getAreaKey();
	}
	
	@Test
	public void getMainIntTest() {
		tsm.getMainInterest();
	}
	
	@Test
	public void getSubIntTest() {
		tsm.getSubInterest("IA00");
	}
	
	@Test
	public void getSelectedTest() {
		TeamVO teamVO = tsm.getTeamInfo(1L);
		tsm.selectedMainInterest(teamVO);
	}
}
