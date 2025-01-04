package com.example.pettopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	// 메인페이지
	@GetMapping("/common/main")
	public String mainPage() {
		return "common/main";
	}
}
