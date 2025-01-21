package com.example.pettopia.documentfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocumentFileController {
	
	@Autowired DocumentFileService documentFileService;
	
	// documentOne → removeDocumentFile 파일 삭제
	@GetMapping("/document/removeDocumentFile")
	public String removeDocumentFile(HttpSession session, @RequestParam Integer docFileNo, @RequestParam Integer docNo, @RequestParam String docType) {
		String path = session.getServletContext().getRealPath("/documentFile/");
		documentFileService.removeDocumentFile(docFileNo, path);
		return "redirect:/document/documentOne?docNo=" + docNo + "&docType=" + docType;
	}

}
