package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.breaktheice.moimat.domain.GroupMemberVO;
import com.breaktheice.moimat.domain.MessageVO;
import com.breaktheice.moimat.domain.TeamMemberDomain;
import com.breaktheice.moimat.domain.TeamMemberListVO;
import com.breaktheice.moimat.service.TeamMemberService;
import com.breaktheice.moimat.util.AdminCriteria;


@RestController
public class TeamMemberController {
	
	@Autowired
	private TeamMemberService tms;
	// 목록 표출
	@GetMapping(value = "/getMemberList/{groupid}/{status}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<TeamMemberListVO> getList(@PathVariable("groupid")Long groupId,@PathVariable("status")String status,AdminCriteria cri){
		// 페이지당 멤버 수 (10개 고정)
		cri.setAmount(10L);
		return new ResponseEntity<>(tms.getMemberList(groupId,status,cri),HttpStatus.OK);
	}
	// 관리대상? 모임원 정보를 가져오는 부분
	@GetMapping(value = "/getMember/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<TeamMemberDomain> getMember(@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(tms.getMember(memberId),HttpStatus.OK);
	}
	// 대장인가 확인용
	@GetMapping(value = "/isMaster/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Boolean> isMaster(@PathVariable("groupid")Long groupId,@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(tms.isMaster(groupId, memberId),HttpStatus.OK);
	}
	// 관리자 이상의 등급 확인용
	@GetMapping(value = "/isAdmin/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Boolean> isAdmin(@PathVariable("groupid")Long groupId,@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(tms.isAdmin(groupId, memberId),HttpStatus.OK);
	}
	 // 가입 승인 (이전 메세지 기능 구현 예정일때 만든 것으로 시간나면 제거 및 스크립트 수정이 필요함)
	 @PutMapping("/admission")
	 public ResponseEntity<String> admission(@RequestBody GroupMemberVO groupMemberVO){
		 return tms.updatemember(groupMemberVO) == groupMemberVO.getTmemIds().size() 
				 ? new ResponseEntity<>("success",HttpStatus.OK)
				 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	 
	 @DeleteMapping("/deletemember")
	 public ResponseEntity<String> delete(@RequestBody GroupMemberVO groupMemberVO){
		
		 return tms.deletemember(groupMemberVO.getTmemIds()) == groupMemberVO.getTmemIds().size() 
				 ? new ResponseEntity<>("success",HttpStatus.OK)
				 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	 
	 @PutMapping("/changelevel")
	 public ResponseEntity<String> changelevel(@RequestBody GroupMemberVO groupMemberVO){
		 return tms.updatemember(groupMemberVO) == groupMemberVO.getTmemIds().size() ? new ResponseEntity<>("success",HttpStatus.OK)
				 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	 
	 @PutMapping("/changeMaster")
	 public ResponseEntity<String> changeMaster(@RequestBody GroupMemberVO groupMemberVO){
		 return tms.updateMaster(groupMemberVO) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	
}
