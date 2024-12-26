package com.example.pettopia.test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TestController {
	@GetMapping("/home")
	public String getMethodName() {
		return "template";
	}
	
	@GetMapping("/notice")
	public String getnotice() {
		return "notice";
	}
	
	@GetMapping("/employee")
	public String employee() {
		return "employee";
	}
	
}
