package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.domain.PostTypeDomain;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostTests {

	@Autowired
	private PostMapper mapper;
	
	@Test
	public void listTest() {
		log.info("시작 : listTest");
		
		PostDomain domain = new PostDomain();
		domain.setPostTypeSeq(1); // 1 : 공지사항

		try {
			log.info("성공 : " + mapper.list(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}


}
