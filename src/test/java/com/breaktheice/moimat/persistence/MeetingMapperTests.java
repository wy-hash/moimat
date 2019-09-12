package com.breaktheice.moimat.persistence;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.MeetVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( "file:src/main/webapp/WEB-INF/spring/root-context.xml" )
@Log4j
public class MeetingMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MeetingMapper mapper;
	
	@Test
	public void getMeetingMemberTest() {
		log.info(mapper.getMeetingMember(1L));
	}
	
	@Test
	public void getMeetTest() {
		log.info(mapper.getMeet(1L));
	}
	
	@Test
	public void regMeetTest() throws ParseException {
		MeetVO vo = new MeetVO();
		vo.setTeamSeq(1L);
		vo.setArea("서초구");
		vo.setMeetDate("2019-10-20 21:30:00");
		vo.setMaxPerson(10);
		vo.setMemberSeq(1L);
		vo.setTitle("모여라!");
		vo.setContent("내용");
		vo.setPayment("엔빵");
		mapper.regMeet(vo);
	}
	
	@Test
	public void modifyMeetTest() throws ParseException {
		MeetVO vo = mapper.getMeet(1L);
		vo.setArea("관악구");
		vo.setMeetDate("2019-10-20 20:30:00");
		vo.setMaxPerson(200);
		vo.setTitle("모여라!!");
		vo.setContent("10월 정기 모임");
		vo.setPayment("20000");
		mapper.modifyMeet(vo);
		mapper.getMeet(1L);
		
	}
}
