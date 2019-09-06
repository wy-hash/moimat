package com.breaktheice.moimat.persistence;

import javax.sql.DataSource;

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
public class DBTests {

	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Setter(onMethod_ = @Autowired)
	private SampleMapper mapper;
	
	@Test
	public void mapperTest() {
		log.info(mapper.selectSampleDomain());
	}
}
