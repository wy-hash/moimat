package com.breaktheice.moimat.controller;

import java.util.List;

import com.breaktheice.moimat.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamSettingsPageVO;
import com.breaktheice.moimat.domain.TeamVO;
import com.breaktheice.moimat.service.TeamSettingsService;

import lombok.extern.log4j.Log4j;
import org.springframework.web.multipart.MultipartFile;

@Controller
@Log4j
public class TeamSettingsController {
	
	@Autowired
	private TeamSettingsService tss;

	@Autowired
	private FileUploadService fileUploadService;
	
	@PostMapping("/modGroup")
	@ResponseBody
	public String modifyGroup(TeamVO teamVO, @RequestParam(value = "file", required = false) MultipartFile file) {
		Long id = teamVO.getTeamId();

		log.info("teamVO: " +teamVO);
		String uploadPath = "";

		if (file.getSize() <= 0) {
			uploadPath = tss.getTeamInfo(teamVO.getTeamId()).getTeamPhoto();

		} else {
			uploadPath = fileUploadService.saveFile("GROUP", file);
			uploadPath = uploadPath.replace("\\", "/");
		}

		teamVO.setTeamPhoto(uploadPath);
        log.info("teamVO: " + teamVO);
		if (tss.updateTeamInfo(teamVO) > 0) {
		    return "{\"result\": true}";
        }

		return "{\"result\": false}";
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

	@ResponseBody
	@GetMapping(value = "/getSettingPage/new/json",
	produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<TeamSettingsPageVO> getSettingBasic(){
		return new ResponseEntity<>(tss.getSettingBasic(),HttpStatus.OK);
	}
}
