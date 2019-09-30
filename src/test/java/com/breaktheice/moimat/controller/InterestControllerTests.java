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
@WebAppConfiguration //Test for Controller
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class InterestControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {// 관심사 목록 출력 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/interest/list")
				).andReturn().getModelAndView().getViewName();
		
		log.info(page);
	}

	@Test
	public void testAdd() throws Exception {// 관심사 등록 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/interest/new")
				.param("intKey", "IN31")
				.param("intName", "관심사 테스트 중입니다.")
				.param("intOrder","0")
				.param("intIsUse", "Y")
				).andReturn().getModelAndView().getViewName();
		
		log.info(page);
	}
	
	@Test
	public void testView() throws Exception {// 관심사 상세 테스트
		
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/interest/view")
				.param("intId", "11")
				).andReturn().getModelAndView().getViewName();
				
		log.info(page);
	}
	
	@Test
	public void testUpdate() throws Exception {// 관심사 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/interest/edit")
				.param("intId", "11")
				.param("intKey", "IN32")
				.param("intName", "관심사 테스트2 중입니다.")
				.param("intOrder","0")
				.param("intIsUse", "N")
				).andReturn().getModelAndView().getViewName();
		log.info(page);
	}
	@Test
	public void testRemove() throws Exception {// 관심사 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/interest/delete")
				.param("intId","11")
				).andReturn().getModelAndView().getViewName();
		log.info(page);
	}
}
