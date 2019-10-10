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

import com.breaktheice.moimat.domain.CalendarEventVO;
import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetingPageVO;
import com.breaktheice.moimat.service.MeetingService;

import lombok.AllArgsConstructor;

@RequestMapping("/meet")
@RestController
@AllArgsConstructor
public class GroupsMeetRestController {
	//테스트용 안쓸거임
	@Inject
	private MeetingService service;
	
	@GetMapping(value = "/getList/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<MeetListVO> getList(@PathVariable("groupid")Long a,@PathVariable("memberid")Long b){
		return new ResponseEntity<>(service.getMeetList(a, b),HttpStatus.OK);
	}
	
	@GetMapping(value = "/getList/{groupid}/{page}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<MeetListVO> getListWithPasing(@PathVariable("groupid")Long groupId,@PathVariable("page")int page,@PathVariable("memberid")Long memberId){
		Criteria cri = new Criteria(page,3);
		return new ResponseEntity<>(service.meetWithPaging(groupId, memberId, cri),HttpStatus.OK);
	}
	
	@GetMapping(value = "/detailedmeet/{meetid}/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<MeetingPageVO> get(@PathVariable("meetid")Long meetId,@PathVariable("groupid")Long groupId,@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(service.readMeet(meetId,groupId,memberId),HttpStatus.OK);
	}
	
	@GetMapping(value = "/getEvent/{groupid}", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<List<CalendarEventVO>> getEvent(@PathVariable("groupid")Long groupId){
		return new ResponseEntity<>(service.getEvent(groupId),HttpStatus.OK);
	}
}
