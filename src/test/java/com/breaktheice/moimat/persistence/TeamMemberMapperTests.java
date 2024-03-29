package com.breaktheice.moimat.persistence;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.util.AdminCriteria;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( "file:src/main/webapp/WEB-INF/spring/root-context.xml" )
@Log4j
public class TeamMemberMapperTests {
	
	@Autowired
	private TeamMemberMapper tmm;
	
	@Test
	public void getMemberTest() { 
		AdminCriteria cri = new AdminCriteria(2L,10L);
		
		log.info(tmm.getMemberList(2L,"member",cri));
	}
	
	@Test
	public void gradeAdjustTest() {
		log.info(tmm.gradeAdjust(39L, 2));
	}
	
	@Test
	public void getOutTest() {
		log.info(tmm.getOut(50L));
	}

	@Test
	public void notifyTest() {
//		MessageVO vo = new MessageVO();
//		vo.setSendMemId(1L);
//		vo.setRecvMemId(31L);
//		vo.setMsgTitle("~~~ 모임의 운영진이 되셨읍니다!@#");
//		vo.setMsgContent("회원님의 ~~모임 등급이 ~~~에서 ~~~로 어쩌구 되셨읍니다.");
//		log.info(tmm.teamMemberNotify(vo));
	}
	
	@Test
	public void selectedTest() {
		List<Long> tmemIds = new ArrayList<>();
		tmemIds.add(47L);
		tmemIds.add(48L);
		log.info(tmm.selectedMemberDelete(tmemIds));
	}
	
	@Test
	public void selectUTest() {
		List<Long> tmemIds = new ArrayList<>();
		tmemIds.add(2L);
		tmemIds.add(49L);
		
	}
	
	@Test
	public void isMasterTest() {
		tmm.isMaster(2L,1L);
	}
	@Test
	public void tmemTest() {
		log.info(tmm.getTmemId(3L, 1L));
	}
	
	@Test
	public void attendTeamTest() {
		log.info(tmm.attendTeam(106L, 136L));
	}
	
	@Test
	public void withdrawTest() {
		log.info(tmm.withdrawTeam(106L, 136L));
	}
	
	@Test
	public void withdrawTestWhenTeamMast() {
		//모임장일땐 탈퇴가 되면 안된다... 137은 현재 모임장인 MEM_ID이다
		//물론 화면에서도 막아야합미다...
		log.info(tmm.withdrawTeam(106L, 137L));
	}
	
}
