package com.example.pettopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ch.qos.logback.core.model.Model;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class DocumentController {
	
	// addDocument Form
	@GetMapping("document/addDocument")
	public String addDocument(	) {
		return "/document/addDocument";
	}
	
	// addDocument Action
	@PostMapping("document/addDocument")
	public String addDocument(Model model) {
		
		return "redirect:/document/addDocument";
	}
	
	

}
