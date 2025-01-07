package com.example.pettopia.controller;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@Slf4j
public class DocumentController {
	
	@GetMapping("document/addDocument")
	public String getAddDocument(	) {
		return "/document/addDocument";
	}
	

}
