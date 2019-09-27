package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.InterestDomain;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InterestTests {

	@Autowired
	private InterestMapper interestMapper;
	
	@Test
	public void addTest() {
		log.info("시작 : addTest");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntKey("testKey");
		domain.setIntName("관심사테스트1");
		
		System.out.println(domain);
		
		try {
			log.info("성공 : " + interestMapper.add(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@Test
	public void listTest() {
		log.info("시작 : listTest");

		try {
			log.info("성공 : " + interestMapper.list());
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Test
	public void view() {
		log.info("시작 : view");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntId(1);;
		
		try {
			log.info("성공 : " + interestMapper.view(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	@Test
	public void update() {
		log.info("시작 : update");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntId(2);;
		domain.setIntKey("IN22");
		domain.setIntName("테스트코드");
		
		try {
			log.info("성공 : " + interestMapper.update(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Test
	public void remove() {
		log.info("시작 : remove");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntId(2);;
		
		try {
			log.info("성공 : " + interestMapper.remove(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}


}
