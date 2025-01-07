package com.example.pettopia.controller;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@Slf4j
public class NoticeController {
	
	@GetMapping("/notice/getNoticeList")
	public String getNoticeList() {
		return "notice/noticeList";
	}
	
	
	

}
