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
public class PostTypeControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {// 관심사 목록 출력 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/post_type/list")
				).andReturn().getModelAndView().getViewName();
		
		log.info(page);
	}

	@Test
	public void testAdd() throws Exception {// 관심사 등록 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/post_type/add")
				.param("key", "MO01")
				.param("value", "모임게시판테스트")
				).andReturn().getModelAndView().getViewName();
		
		log.info(page);
	}
	
	@Test
	public void testView() throws Exception {// 관심사 상세 테스트
		
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/post_type/view")
				.param("seq", "22")
				).andReturn().getModelAndView().getViewName();
				
		log.info(page);
	}
	
	@Test
	public void testUpdate() throws Exception {// 관심사 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/post_type/update")
				.param("seq","22")
				.param("key","MO22")
				.param("value","모임게시판")
				).andReturn().getModelAndView().getViewName();
		log.info(page);
	}
	@Test
	public void testRemove() throws Exception {// 관심사 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/post_type/remove")
				.param("seq","22")
				).andReturn().getModelAndView().getViewName();
		log.info(page);
	}
}
