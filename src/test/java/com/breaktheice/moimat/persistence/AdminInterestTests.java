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
public class AdminInterestTests {

	@Autowired
	private InterestMapper mapper;
	
	@Test
	public void addTest() {
		log.info("시작 : addTest");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntKey("IN12");
		domain.setIntName("관심사테스트12");
		domain.setIntOrder(0L);
		domain.setIntIsUse("Y");
		
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
	public void view() {
		log.info("시작 : view");
		
		InterestDomain domain = new InterestDomain();

		domain.setIntId(9L);

		
		try {
			log.info("성공 : " + mapper.view(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	@Test
	public void update() {
		log.info("시작 : update");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntId(9L);
		domain.setIntKey("IN99");
		domain.setIntName("관심사 수정하였습니다12443");
		domain.setIntOrder(33L);
		domain.setIntIsUse("N");
		try {
			log.info("성공 : " + mapper.update(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Test
	public void remove() {
		log.info("시작 : remove");
		
		InterestDomain domain = new InterestDomain();
		domain.setIntId(9L);
		
		try {
			log.info("성공 : " + mapper.remove(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}


}
