package com.example.pettopia.document;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Document;
import com.example.pettopia.vo.DocumentApprovers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
@Slf4j
public class DocumentController {
	
	@Autowired DocumentService documentService;
	
	// addDocument Form
	@GetMapping("/document/addDocument")
	public String addDocument(Model model, Authentication authentication) {
		
		EmpUserDetails empUserDetails = (EmpUserDetails)authentication.getPrincipal();
		String empNo = empUserDetails.getUsername();
		String empName = empUserDetails.getEmpName();
		
		Map<String,Object> empDept = documentService.getEmployeeDept(empNo);
		log.debug(TeamColor.KDH + "empDept : " + empDept.toString() + TeamColor.RESET);
		log.debug(TeamColor.KDH + "empNo : " + empNo + TeamColor.RESET);
		log.debug(TeamColor.KDH + "empName : " + empName + TeamColor.RESET);
		
		model.addAttribute("empDept", empDept);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empName", empName);
		
		return "document/addDocument";
	}
	
	// addDocument Action
	@PostMapping("/document/addDocument")
	public String addDocument(Model model, Document document, DocumentApprovers documentApprovers) {
		
		log.debug(TeamColor.KDH + "document : " + document.toString() + TeamColor.RESET);
		
		int insertDocRow = documentService.addDocument(document, documentApprovers);
		
		return "redirect:/document/documentList";
	}
	
	// documentList Form
	@GetMapping("/document/documentList")
	public String getDocumentList() {
		return "document/documentList";
	}
	
	

}
