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
	public void searchTest() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("test");
		cri.setType("M");
		
//		List<TeamDomain> list = mapper.list()
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<TeamDomain> list = mapper.list(cri);
		
		list.forEach(team -> log.info(team));
	}
	
	@Test
	public void testGetList() {
		
		service.list(new Criteria(1, 10)).forEach(team -> log.info(team));
	}
	
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
		
		String name = "te";
		
		log.info(service.autocomplete(name));
	}
}
