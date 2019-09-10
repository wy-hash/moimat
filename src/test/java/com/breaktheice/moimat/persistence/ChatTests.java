package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.ChatDomain;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChatTests {

	@Autowired
	private ChatMapper chatMapper;
	
	@Test
	public void test() {
		
		log.info("_ -> Camelcase 테스트");
		
		try {
			if (chatMapper.list() != null) {
				
				
				for(ChatDomain chatDomain :chatMapper.list() ) {
					log.info(chatDomain);				
				}
			}
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

}
