package com.breaktheice.moimat.service;

import java.text.ParseException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MeetingServiceTests {

	@Autowired
	private MeetingService service;
	
	@Test
	public void getListTest() throws ParseException {
		MeetVO meetVO = new MeetVO();
		MeetMemberVO meetMemberVO = new MeetMemberVO();
		meetVO.setTeamSeq(1L);
		meetVO.setArea("관악구");
		meetVO.setMeetDate("2019-10-19 16:30:00");
		meetVO.setMaxPerson(10);
		meetVO.setMemberSeq(1L);
		meetVO.setContent("테스트");
		meetVO.setTitle("테스트");
		meetVO.setPayment("1234");
		meetMemberVO.setMemberSeq(1L);
		service.createMeet(meetVO, 2L);
	}
	
	@Test
	public void readMeetTest() {
		log.info(service.readMeet(35L, 2L));
	}
}
