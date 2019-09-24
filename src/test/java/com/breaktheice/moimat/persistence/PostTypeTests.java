package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.PostTypeDomain;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostTypeTests {

	@Autowired
	private PostTypeMapper mapper;
	
	@Test
	public void addTest() {
		log.info("시작 : addTest");
		
		PostTypeDomain domain = new PostTypeDomain();
		domain.setKey("PO30");
		domain.setValue("게시판 30");
		
		System.out.println(domain);
		
		try {
			log.info("성공 : " + mapper.add(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@Test
	public void listTest() {
		log.info("시작 : listTest");

		try {
			log.info("성공 : " + mapper.list());
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Test
	public void viewTest() {
		log.info("시작 : view");
		
		PostTypeDomain domain = new PostTypeDomain();
		domain.setSeq(21);
		
		try {
			log.info("성공 : " + mapper.view(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	@Test
	public void updateTest() {
		log.info("시작 : update");
		
		PostTypeDomain domain = new PostTypeDomain();
		domain.setSeq(21);
		domain.setKey("PO31");
		domain.setValue("테스트코드");
		
		try {
			log.info("성공 : " + mapper.update(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Test
	public void removeTest() {
		log.info("시작 : remove");
		
		PostTypeDomain domain = new PostTypeDomain();
		domain.setSeq(21);
		
		try {
			log.info("성공 : " + mapper.remove(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}


}
