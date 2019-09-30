package com.breaktheice.moimat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@RequestMapping(value= {"","/"})
	public String faq() {
		return "faq";
	}

}
