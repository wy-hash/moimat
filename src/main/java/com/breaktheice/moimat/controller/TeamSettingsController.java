package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamSettingsPageVO;
import com.breaktheice.moimat.domain.TeamVO;
import com.breaktheice.moimat.service.TeamSettingsService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TeamSettingsController {
	
	@Autowired
	private TeamSettingsService tss;
	
	@PostMapping("/modGroup")
	public String modifyGroup(TeamVO teamVO) {
		Long id = teamVO.getTeamId();
		tss.updateTeamInfo(teamVO);
		return "redirect:/groups/"+id+"/settings";
	}
	
	@ResponseBody
	@GetMapping(value = "/getSettingPage/{groupId}",
	produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<TeamSettingsPageVO> getSettingPage(@PathVariable("groupId")Long groupId){
		return new ResponseEntity<>(tss.getSettingPage(groupId),HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/getSubInt/{intkey}",
	produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<List<InterestDomain>> getSubInt(@PathVariable("intkey")String intkey){
		return new ResponseEntity<>(tss.getSubInterest(intkey),HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/getRegion/{areakey}",
	produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<List<AreaDomain>> getAreaRegin(@PathVariable("areakey")String areakey){
		return new ResponseEntity<>(tss.getRegionArea(areakey),HttpStatus.OK);
	}
	
}
