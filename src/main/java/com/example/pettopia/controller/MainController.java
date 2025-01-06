package com.example.pettopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.util.TeamColor;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
	
	// 메인페이지
	@GetMapping("/common/main")
	public String mainPage() {
		log.debug(TeamColor.KDH + "Test Log Color" + TeamColor.RESET);
		log.debug(TeamColor.KMJ + "Test Log Color" + TeamColor.RESET);
		log.debug(TeamColor.OJY + "Test Log Color" + TeamColor.RESET);
		log.debug(TeamColor.WJ + "Test Log Color" + TeamColor.RESET);
		log.debug(TeamColor.LJH + "Test Log Color" + TeamColor.RESET);
		return "common/main";
	}
}
