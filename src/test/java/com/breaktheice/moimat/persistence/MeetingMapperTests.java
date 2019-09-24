package com.breaktheice.moimat.persistence;

import java.text.ParseException;

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
	public void getMeetListTest() {
		log.info(mapper.getMeetList(2L));
	}
	
	@Test
	public void getMeetTest() {
		log.info(mapper.getMeet(12L));
	}
	
	@Test
	public void regMeetTest() throws ParseException {
		MeetVO vo = new MeetVO();
		vo.setTeamId(2L);
		vo.setMeetTitle("모이시오!");
		vo.setMeetContent("모임 내용");
		vo.setMeetDate("2019-10-11 20:30");
		vo.setMeetMax(10);
		vo.setMeetPay("엔빵임임임임");
		vo.setTmemId(1L);
		vo.setMeetNickName("닉네이임");
		mapper.regMeet(vo);
	}
	
	
}
