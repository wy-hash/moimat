package com.breaktheice.moimat.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.MemberDomain;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {
	
	@Autowired
	private UserService us;
	@Test
	public void test() {
		MemberDomain md = new MemberDomain();
		md.setMemId(5L);
		md.setMemNickname("뭄뭄");
		log.info(us.updateMember(md));
	}

}
