package com.breaktheice.moimat.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.service.MeetingService;

import lombok.AllArgsConstructor;

@RequestMapping("/cal")
@RestController
@AllArgsConstructor
public class CalController {
	//테스트용 안쓸거임
	@Inject
	private MeetingService service;
	
	@GetMapping(value = "/ca/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<List<MeetVO>> getList(@PathVariable("groupid")Long a,@PathVariable("memberid")Long b){
		return new ResponseEntity<>(service.getMeetList(a, b).getMeetList(),HttpStatus.OK);
	}
}
