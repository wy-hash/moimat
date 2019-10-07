package com.breaktheice.moimat.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.SearchMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SearchTests {

	@Autowired
	private SearchService service;
	
	@Autowired
	private SearchMapper mapper;
	
	@Test
	public void testIntList() {
		
		service.intList().forEach(interest -> log.info(interest));
		
	}
	
	@Test
	public void testFiveRecommend() {
		
//		service.recommend().forEach(recom -> log.info(recom));
		
		List<String> list = new ArrayList<String>();
		
		log.info(list.size());
		log.info(list);
		
	}
	
	@Test
	public void testRecommedResult() {
		
	}
	
	@Test
	public void testAutocomplete() {
		
		
		
		log.info(service.autocomplete("name"));
	}
}
