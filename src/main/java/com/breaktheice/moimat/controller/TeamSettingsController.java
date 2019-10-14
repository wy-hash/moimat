package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.TeamSettingsPageVO;
import com.breaktheice.moimat.service.TeamSettingsService;

@Controller
public class TeamSettingsController {
	
	@Autowired
	private TeamSettingsService tss;
	
	@ResponseBody
	@GetMapping(value = "/getSettingPage/{groupId}",
	produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<TeamSettingsPageVO> getSettingPage(@PathVariable("groupId")Long groupId){
		return new ResponseEntity<>(tss.getSettingPage(groupId),HttpStatus.OK);
	}

}
