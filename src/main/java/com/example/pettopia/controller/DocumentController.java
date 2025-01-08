package com.example.pettopia.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.pettopia.service.DocumentService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Document;
import com.example.pettopia.vo.Employee;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class DocumentController {
	
	@Autowired DocumentService documentService;
	
	// addDocument Form
	@GetMapping("document/addDocument")
	public String addDocument(Model model, HttpSession session) {
		
		Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		String empNo = loginEmp.getEmpNo();
		
		Map<String,Object> empDept = documentService.getEmployeeDept(empNo);
		log.debug(TeamColor.KDH + "empDept : " + empDept.toString() + TeamColor.RESET);
		
		model.addAttribute("empDept", empDept);
		
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
