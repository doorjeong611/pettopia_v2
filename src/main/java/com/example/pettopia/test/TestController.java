package com.example.pettopia.test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TestController {
	@GetMapping("/test")
	public String getMethodName() {
		log.debug("index");
		return "index";
	}
	
}
