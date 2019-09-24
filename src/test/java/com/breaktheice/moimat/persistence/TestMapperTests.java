package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( "file:src/main/webapp/WEB-INF/spring/root-context.xml" )
@Log4j
public class TestMapperTests {

//	@Setter(onMethod_ = @Autowired)
//	private DataSource dataSource;
	
	@Setter(onMethod_ = @Autowired)
	private TestMapper mapper;
	
//	@Test
//	public void getMeetTest() {
//		log.info(mapper.getMeet());
//	}
	@Test
	public void getMeetMemberTest() {
		log.info(mapper.getMeetMember());
	}
	@Test
	public void getMemberTest() {
		log.info(mapper.getMember());
	}
//	@Test
//	public void getMemberRoleTest() {
//		log.info(mapper.getMemberRole());
//	}
	@Test
	public void getRole() {
		log.info(mapper.getRole());
	}
	@Test
	public void getTeamTest() {
		log.info(mapper.getTeam());
	}
	@Test
	public void getTeamMemberTest() {
		log.info(mapper.getTeamMember());
	}
	
}
