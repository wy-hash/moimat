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


@RestController
public class TeamMemberController {
	
	@Autowired
	private TeamMemberService tms;
	
	@GetMapping(value = "/getMemberList/{groupid}/{keyword}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<TeamMemberListVO> getList(@PathVariable("groupid")Long groupId,@PathVariable("keyword")String keyword){
		return new ResponseEntity<>(tms.getMemberList(groupId,keyword),HttpStatus.OK);
	}
	
	@GetMapping(value = "/getMember/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<TeamMemberDomain> getMember(@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(tms.getMember(memberId),HttpStatus.OK);
	}
	
	@GetMapping(value = "/isMaster/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Boolean> isMaster(@PathVariable("groupid")Long groupId,@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(tms.isMaster(groupId, memberId),HttpStatus.OK);
	}
	//임시용임 
	@GetMapping(value = "/isAdmin/{groupid}/{memberid}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Boolean> isAdmin(@PathVariable("groupid")Long groupId,@PathVariable("memberid")Long memberId){
		return new ResponseEntity<>(tms.isAdmin(groupId, memberId),HttpStatus.OK);
	}
	
	 @PutMapping("/relesemember")
	 public ResponseEntity<String> relese(@RequestBody GroupMemberVO groupMemberVO){
		 MessageVO message = new MessageVO();
		 message.setSendMemId(groupMemberVO.getMemberId());
		 String teamName = groupMemberVO.getTeamName();
		 message.setMsgTitle(teamName + "모임에서 차단해제되었습니다.");
		 message.setMsgContent("모임 관리자에 의하여"+teamName+" 모임에서 차단해제 되었습니다.");
		 return tms.updatemember(groupMemberVO,message) == groupMemberVO.getTmemIds().size() 
				 ? new ResponseEntity<>("success",HttpStatus.OK)
				 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	 
	 @PutMapping("/admission")
	 public ResponseEntity<String> admission(@RequestBody GroupMemberVO groupMemberVO){
		 MessageVO message = new MessageVO();
		 message.setSendMemId(groupMemberVO.getMemberId());
		 String teamName = groupMemberVO.getTeamName();
		 message.setMsgTitle(teamName + "모임에서 가입되셨습니다.");
		 message.setMsgContent("환영합니다! "+teamName+" 모임에 가입되었습니다. 즐거운 경험을 공유해봐요~");
		 return tms.updatemember(groupMemberVO,message) == groupMemberVO.getTmemIds().size() 
				 ? new ResponseEntity<>("success",HttpStatus.OK)
				 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 }
	 
	 @DeleteMapping("/deletemember")
	 public ResponseEntity<String> delete(@RequestBody GroupMemberVO groupMemberVO){
		 MessageVO message = new MessageVO();
		 message.setSendMemId(groupMemberVO.getMemberId());
		 String teamName = groupMemberVO.getTeamName();
		 message.setMsgTitle(teamName + "모임에서 강제탈퇴되었습니다.");
		 message.setMsgContent("모임 관리자에 의하여"+teamName+" 모임에서 강제탈퇴 되었습니다.");
		 return tms.deletemember(groupMemberVO.getTmemIds(),message) == groupMemberVO.getTmemIds().size() 
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
