package com.example.pettopia.document;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.documentfile.DocumentFileService;
import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.employeefile.EmployeeFileService;
import com.example.pettopia.util.Page;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Document;
import com.example.pettopia.vo.DocumentApprovers;
import com.example.pettopia.vo.DocumentFile;
import com.example.pettopia.vo.EmployeeFile;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocumentController {
	
	@Autowired DocumentService documentService;
	@Autowired DocumentFileService documentFileService;
	@Autowired EmployeeFileService employeeFileService;
	
	// addDocument Form
	@GetMapping("/document/addDocument")
	public String addDocument(Model model, Authentication authentication) {
		
		EmpUserDetails empUserDetails = (EmpUserDetails)authentication.getPrincipal();
		String empNo = empUserDetails.getUsername();
		String empName = empUserDetails.getEmpName();
		String empRankName = empUserDetails.getRankName();
		
		Map<String,Object> empDept = documentService.getEmployeeDept(empNo);
		log.debug(TeamColor.KDH + "empDept : " + empDept.toString() + TeamColor.RESET);
		log.debug(TeamColor.KDH + "empNo : " + empNo + TeamColor.RESET);
		log.debug(TeamColor.KDH + "empName : " + empName + TeamColor.RESET);
		
		model.addAttribute("empDept", empDept);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empName", empName);
		model.addAttribute("empRankName", empRankName);
		
		return "document/addDocument";
	}
	
	// addDocument Action
	@PostMapping("/document/addDocument")
	public String addDocument(Model model, HttpSession session, Document document, DocumentApprovers documentApprovers, DocumentFile documentFile) {
		
		log.debug(TeamColor.KDH + "document : " + document.toString() + TeamColor.RESET);
		
		// documentFile이 null인지 체크
	    if (documentFile != null && documentFile.getDocumentFile() != null) {
	        List<MultipartFile> documentFileList = documentFile.getDocumentFile();
	        log.debug(TeamColor.KDH + "documentFileList.size() : " + documentFileList.size() + TeamColor.RESET); // 파일 사이즈
	        
	        // 상품정보만 입력하고 파일이 첨부되지 않은 경우
	        if (documentFileList.isEmpty()) {
	            String path = null;
	            documentService.addDocument(document, documentApprovers, documentFile, path);
	            return "redirect:/document/documentList";
	        }

	        // 파일이 첨부된 경우
	        String path = session.getServletContext().getRealPath("/documentFile/");
	        documentService.addDocument(document, documentApprovers, documentFile, path);
	    } else {
	        // 파일이 첨부되지 않은 경우
	        String path = null;
	        documentService.addDocument(document, documentApprovers, documentFile, path);
	    }
		
		return "redirect:/document/documentList";
	}
	
	// documentList Form
	@GetMapping("/document/documentList")
    public String getDocumentList(Model model, Authentication authentication, HttpSession session, Page page) {
        EmpUserDetails empUserDetails = (EmpUserDetails) authentication.getPrincipal();
        String empNo = empUserDetails.getUsername();
        
        // 세션에서 필터링 조건 가져오기
        String highlight = (String) session.getAttribute("highlight");
        String docWriterNo = (String) session.getAttribute("docWriterNo");
        String initApproverNo = (String) session.getAttribute("initApproverNo");
        String midApproverNo = (String) session.getAttribute("midApproverNo");
        String finalApproverNo = (String) session.getAttribute("finalApproverNo");
        String approvalStatus = (String) session.getAttribute("approvalStatus");
        String searchWord = (String) session.getAttribute("searchWord");
        
        // 문서 리스트 조회를 위한 파라미터 맵 생성
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("empNo", empNo);
        
        // null 체크 후 값 추가
        if (docWriterNo != null) {
            paramMap.put("docWriterNo", docWriterNo);
        }
        if (initApproverNo != null) {
            paramMap.put("initApproverNo", initApproverNo);
        }
        if (midApproverNo != null) {
            paramMap.put("midApproverNo", midApproverNo);
        }
        if (finalApproverNo != null) {
            paramMap.put("finalApproverNo", finalApproverNo);
        }
        if (approvalStatus != null) {
            paramMap.put("approvalStatus", approvalStatus);
        }
        if (searchWord != null && !searchWord.isEmpty()) {
            paramMap.put("searchWord", searchWord);	
        }

        // 문서 리스트 로드
        Map<String, Object> documentList = documentService.getDocumentList(page, paramMap);
        log.debug(TeamColor.KDH + "getDocumnetList : " + documentList.toString() + TeamColor.RESET);
        
        log.debug(TeamColor.KDH + "currentPage : " + page.getCurrentPage() + TeamColor.RESET);

        model.addAttribute("empNo", empNo);
        model.addAttribute("page", documentList.get("page"));
        model.addAttribute("documentList", documentList.get("documentList"));
        model.addAttribute("highlight", highlight);

        return "document/documentList";
    }
	
	@PostMapping("/document/documentList")
    public String getDocumentList(Model model, Authentication authentication,
                                  @RequestParam(required = false) String docWriterNo,
                                  @RequestParam(required = false) String initApproverNo,
                                  @RequestParam(required = false) String midApproverNo,
                                  @RequestParam(required = false) String finalApproverNo,
                                  @RequestParam(required = false) String approvalStatus,
                                  @RequestParam(required = false) String highlight,
                                  @RequestParam(required = false) String searchWord,
                                  HttpSession session) {

        // 세션에 필터링 조건 저장
        session.setAttribute("highlight", highlight);
        session.setAttribute("docWriterNo", docWriterNo);
        session.setAttribute("initApproverNo", initApproverNo);
        session.setAttribute("midApproverNo", midApproverNo);
        session.setAttribute("finalApproverNo", finalApproverNo);
        session.setAttribute("approvalStatus", approvalStatus);
        session.setAttribute("searchWord", searchWord);
        
        // 필터링된 문서 리스트를 가져오기 위해 리다이렉트
        return "redirect:/document/documentList";
    }
	
	// documentBin Form
	@GetMapping("/document/documentBinList")
	public String getDocumentBin(Model model, Authentication authentication, HttpSession session, Page page) {
		
		EmpUserDetails empUserDetails = (EmpUserDetails) authentication.getPrincipal();
        String empNo = empUserDetails.getUsername();
        
        // 세션에서 필터링 조건 가져오기
        String highlight = (String) session.getAttribute("highlight");
        String docWriterNo = (String) session.getAttribute("docWriterNo");
        String initApproverNo = (String) session.getAttribute("initApproverNo");
        String midApproverNo = (String) session.getAttribute("midApproverNo");
        String finalApproverNo = (String) session.getAttribute("finalApproverNo");
        String approvalStatus = (String) session.getAttribute("approvalStatus");
        String searchWord = (String) session.getAttribute("searchWord");
        
        log.debug(TeamColor.KDH + "bin.searchWord : " + searchWord + TeamColor.RESET);
        
        // 문서 리스트 조회를 위한 파라미터 맵 생성
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("empNo", empNo);
        
        // null 체크 후 값 추가
        if (docWriterNo != null) {
            paramMap.put("docWriterNo", docWriterNo);
        }
        if (initApproverNo != null) {
            paramMap.put("initApproverNo", initApproverNo);
        }
        if (midApproverNo != null) {
            paramMap.put("midApproverNo", midApproverNo);
        }
        if (finalApproverNo != null) {
            paramMap.put("finalApproverNo", finalApproverNo);
        }
        if (approvalStatus != null) {
            paramMap.put("approvalStatus", approvalStatus);
        }
        if (searchWord != null && !searchWord.isEmpty()) {
            paramMap.put("searchWord", searchWord);	
        }

        // 문서 리스트 로드
        Map<String, Object> documentBin = documentService.getDocumentBin(page, paramMap);
        log.debug(TeamColor.KDH + "documentBin : " + documentBin.toString() + TeamColor.RESET);
        
        log.debug(TeamColor.KDH + "currentPage : " + page.getCurrentPage() + TeamColor.RESET);

        model.addAttribute("empNo", empNo);
        model.addAttribute("page", documentBin.get("page"));
        model.addAttribute("documentBin", documentBin.get("documentBin"));
        model.addAttribute("highlight", highlight);
		
		return "document/documentBinList";
	}
	
	@PostMapping("/document/documentBinList")
    public String getDocumentBin(Model model, Authentication authentication,
                                  @RequestParam(required = false) String docWriterNo,
                                  @RequestParam(required = false) String initApproverNo,
                                  @RequestParam(required = false) String midApproverNo,
                                  @RequestParam(required = false) String finalApproverNo,
                                  @RequestParam(required = false) String approvalStatus,
                                  @RequestParam(required = false) String highlight,
                                  @RequestParam(required = false) String searchWord,
                                  HttpSession session) {

        // 세션에 필터링 조건 저장
        session.setAttribute("highlight", highlight);
        session.setAttribute("docWriterNo", docWriterNo);
        session.setAttribute("initApproverNo", initApproverNo);
        session.setAttribute("midApproverNo", midApproverNo);
        session.setAttribute("finalApproverNo", finalApproverNo);
        session.setAttribute("approvalStatus", approvalStatus);
        session.setAttribute("searchWord", searchWord);
        
        return "redirect:/document/documentBinList";
    }
	
	// documentBin Action - 문서 휴지통
	@PostMapping("/document/documentBin")
	public String getDocumentBin(Model model, @RequestParam(required = false) Integer[] docNoList) {
	    if (docNoList != null) {
	        for (Integer docNo : docNoList) {
	            log.debug(TeamColor.KDH + "Received docNo: " + docNo + TeamColor.RESET);
	            documentService.modifyDocumentBin(docNo);
	            log.debug(TeamColor.KDH + "modifyDocumentBin: " + docNo + ".문서 휴지통으로 이동" + TeamColor.RESET);
	        }
	    } else {
	        log.debug(TeamColor.KDH + "No documents selected" + TeamColor.RESET);
	    }

	    return "redirect:/document/documentList";
	}
	
	// documentRestore Action - 문서 복원
	@PostMapping("/document/documentRestore")
	public String getDocumentRestore(Model model, @RequestParam(required = false) Integer[] docNoList) {
	    if (docNoList != null) {
	        for (Integer docNo : docNoList) {
	            log.debug(TeamColor.KDH + "Received docNo: " + docNo + TeamColor.RESET);
	            documentService.modifyDocumentBin(docNo);
	            log.debug(TeamColor.KDH + "modifyDocumentBin: " + docNo + ". 문서 보관함으로 이동" + TeamColor.RESET);
	        }
	    } else {
	        log.debug(TeamColor.KDH + "No documents selected" + TeamColor.RESET);
	    }

	    return "redirect:/document/documentBinList";
	}
	
	// documentRemove Action - 문서 영구 삭제
	@PostMapping("/document/documentRemove")
	public String getDocumentRemove(Model model, HttpSession session, @RequestParam(required = false) Integer[] docNoList) {
	    if (docNoList != null) {
	        for (Integer docNo : docNoList) {
	            log.debug(TeamColor.KDH + "Received docNo: " + docNo + TeamColor.RESET);
	            String path = session.getServletContext().getRealPath("/documentFile/");
	            documentService.removeDocument(docNo, path);
	            log.debug(TeamColor.KDH + "removeDocument: " + docNo + ".문서 영구 삭제" + TeamColor.RESET);
	        }
	    } else {
	        log.debug(TeamColor.KDH + "No documents selected" + TeamColor.RESET);
	    }

	    return "redirect:/document/documentBinList";
	}
	
	// documentOne Form
	@GetMapping("/document/documentOne")
	public String getDocumentOne(Model model, Authentication authentication, @RequestParam Integer docNo, @RequestParam String docType) {
		
		EmpUserDetails empUserDetails = (EmpUserDetails)authentication.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		model.addAttribute("empNo", empNo);
		
		Map<String, Object> documentOne = documentService.getDocumentOne(docNo);
		log.debug(TeamColor.KDH + "documentOne: " + documentOne.toString() + TeamColor.RESET);
		
		List<DocumentFile> documentFile = documentFileService.getDocumentFileList(docNo);
		
		EmployeeFile writerSignFile =  employeeFileService.getEmployeeSignFile((String)documentOne.get("docWriterNo"));
		EmployeeFile initSignFile =  employeeFileService.getEmployeeSignFile((String)documentOne.get("initApproverNo"));
		EmployeeFile midSignFile =  employeeFileService.getEmployeeSignFile((String)documentOne.get("midApproverNo"));
		EmployeeFile finalSignFile =  employeeFileService.getEmployeeSignFile((String)documentOne.get("finalApproverNo"));
		
		model.addAttribute("documentOne", documentOne);
		model.addAttribute("documentFile", documentFile);
		model.addAttribute("writerSignFile", writerSignFile);
		model.addAttribute("initSignFile", initSignFile);
		model.addAttribute("midSignFile", midSignFile);
		model.addAttribute("finalSignFile", finalSignFile);
		
		// 문서 유형에 따라 페이지 이동
		switch (docType) {
	    case "D":
	        return "document/draftOne";
	    case "V":
	        return "document/vacationOne";
	    case "M":
	        return "document/materialOne";
	    case "R":
	        return "document/resignationOne";
		}
		
		return "document/documentList";
	}
	
	// documentOne Form → 문서 승인 action
	@GetMapping("/document/approveDocument") 
	public String approveDocument(Model model, @RequestParam Integer docNo, @RequestParam String docType, @RequestParam Integer docApproversNo, 
											   @RequestParam(required = false) Integer initApproverNo,
											   @RequestParam(required = false) Integer midApproverNo,
											   @RequestParam(required = false) Integer finalApproverNo) {
		
		documentService.approveDocument(docApproversNo, initApproverNo, midApproverNo, finalApproverNo);
		
		return "redirect:/document/documentOne?docNo=" + docNo + "&docType=" + docType;
	}
	
	// documentOne Form  → 문서 반려 action
	@GetMapping("/document/rejectDocument") 
	public String rejectDocument(Model model, @RequestParam Integer docNo, @RequestParam String docType, @RequestParam Integer docApproversNo, 
											  @RequestParam(required = false) Integer initApproverNo,
											  @RequestParam(required = false) Integer midApproverNo,
											  @RequestParam(required = false) Integer finalApproverNo,
											  @RequestParam(required = false) String initRejectReason,
											  @RequestParam(required = false) String midRejectReason,
											  @RequestParam(required = false) String finalRejectReason) {

		documentService.rejectDocument(docApproversNo, initApproverNo, midApproverNo, finalApproverNo, initRejectReason, midRejectReason, finalRejectReason);
		
		return "redirect:/document/documentOne?docNo=" + docNo + "&docType=" + docType;
	}

	

}
