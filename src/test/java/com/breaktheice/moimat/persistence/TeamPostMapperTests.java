package com.breaktheice.moimat.persistence;

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
public class TeamPostMapperTests {
	
	@Autowired
	private TeamPostMapper tpm;
	
	@Test
	public void selectAllPostsTest() {
		AdminCriteria cri = new AdminCriteria();
		cri.setBrdId(23L);
		cri.setType("T");
		cri.setKeyword("안");
		tpm.selectAllPosts(1L, cri);
	}

}
