package com.example.pettopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.pettopia.service.DocumentService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Document;

import ch.qos.logback.core.model.Model;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class DocumentController {
	
	@Autowired DocumentService documentService;
	
	// addDocument Form
	@GetMapping("document/addDocument")
	public String addDocument(	) {
		return "/document/addDocument";
	}
	
	// addDocument Action
	@PostMapping("document/addDocument")
	public String addDocument(Model model, Document document) {
		
		log.debug(TeamColor.KDH + "document : " + document.toString() + TeamColor.RESET);
		
		int insertDocRow = documentService.addDocument(document);
		
		return "redirect:/document/documentList";
	}
	
	

}
