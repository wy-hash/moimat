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
public class SampleServiceTests {

	@Autowired
	private SampleService service;
	
	@Test
	public void getListTest() {
		log.info(service.getSampleDomain());
	}
	
}
