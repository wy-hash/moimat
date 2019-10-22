package com.breaktheice.moimat.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.breaktheice.moimat.domain.CalendarEventVO;
import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.MeetingService;
import com.breaktheice.moimat.util.AdminCriteria;

import lombok.AllArgsConstructor;

@RequestMapping("/meet")
@RestController
@AllArgsConstructor
public class GroupsMeetRestController {
	//테스트용 안쓸거임
	@Inject
	private MeetingService service;
	
	@GetMapping(value = "/getList/{groupid}/{page}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<MeetListVO> getListWithPasing(@PathVariable("groupid")Long groupId,@PathVariable("page")Long page,@PathVariable("memberid")Long memberId){
		AdminCriteria cri = new AdminCriteria(page,3L);
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
	
	@DeleteMapping("/deleteMeet")
	public ResponseEntity<String> delete(@RequestBody MeetVO meetVO){
		 Long meetId = meetVO.getMeetId();
		 service.deleteMeet(meetId);
		 return new ResponseEntity<>("success",HttpStatus.OK);
	 }
	
	@DeleteMapping("/cancelMeet")
	public ResponseEntity<String> cancel(@RequestBody MeetVO meetVO,HttpServletRequest request){
		 Long meetId = meetVO.getMeetId();
		 Long groupId = meetVO.getTeamId();
		 HttpSession session = request.getSession();
		 MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		 Long memId = md.getMemId();
		 service.cancelAttend(meetId, groupId, memId);
		 return new ResponseEntity<>("success",HttpStatus.OK);
	 }
	
	@PostMapping("/attendMeet")
	public ResponseEntity<String> attendMeet(@RequestBody MeetVO meetVO,HttpServletRequest request){
		 Long meetId = meetVO.getMeetId();
		 Long groupId = meetVO.getTeamId();
		 HttpSession session = request.getSession();
		 MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		 Long memId = md.getMemId();
		 service.attendMeet(meetId, groupId, memId);
		 return new ResponseEntity<>("success",HttpStatus.OK);
	 }
	
}
