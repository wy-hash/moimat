package com.breaktheice.moimat.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class SampleControllerTests {

	@Autowired
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
<<<<<<< Updated upstream:src/test/java/com/breaktheice/moimat/controller/SampleControllerTests.java
=======
	/*
	 * @Test public void testPhotoController() {
	 * 
	 * List<PhotoDomain> list = service.selectBoardList(); System.out.println(list);
	 * 
	 * }
	 */
	
	// 사진첩 목록 출력 테스트
>>>>>>> Stashed changes:src/test/java/com/breaktheice/moimat/controller/PhotoControllerTests.java
	@Test
	public void testIndexPage() throws Exception {
		
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
}
