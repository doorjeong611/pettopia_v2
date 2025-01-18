package com.example.pettopia.document;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Document;
import com.example.pettopia.vo.DocumentApprovers;

import jakarta.servlet.http.HttpSession;
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
    public String getDocumentList(Model model, Authentication authentication, HttpSession session) {
        EmpUserDetails empUserDetails = (EmpUserDetails) authentication.getPrincipal();
        String empNo = empUserDetails.getUsername();

        // 세션에서 필터링 조건 가져오기
        String highlight = (String) session.getAttribute("highlight");
        String docWriterNo = (String) session.getAttribute("docWriterNo");
        String initApproverNo = (String) session.getAttribute("initApproverNo");
        String approvalStatus = (String) session.getAttribute("approvalStatus");

        // 문서 리스트 로드
        List<Map<String, Object>> documentList = documentService.getDocumnetList(empNo, docWriterNo, initApproverNo, approvalStatus);

        model.addAttribute("empNo", empNo);
        model.addAttribute("documentList", documentList);
        model.addAttribute("highlight", highlight);

        return "document/documentList";
    }
	
	@PostMapping("/document/documentList")
    public String filterDocuments(Model model, Authentication authentication,
                                  @RequestParam(required = false) String docWriterNo,
                                  @RequestParam(required = false) String initApproverNo,
                                  @RequestParam(required = false) String approvalStatus,
                                  @RequestParam(required = false) String highlight,
                                  HttpSession session) {
        // 세션에 필터링 조건 저장
        session.setAttribute("highlight", highlight);
        session.setAttribute("docWriterNo", docWriterNo);
        session.setAttribute("initApproverNo", initApproverNo);
        session.setAttribute("approvalStatus", approvalStatus);

        // 필터링된 문서 리스트를 가져오기 위해 리다이렉트
        return "redirect:/document/documentList";
    }
	
	// documentOne Form
	@GetMapping("/document/documentOne")
	public String getDocumentOne(Model model, String highlight, @RequestParam String docNo) {
		
		return "document/documentOne?docNo" + docNo;
	}

	
	

}
