package com.example.pettopia.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.noticefile.NoticeFileService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;

import jakarta.servlet.http.HttpSession;



@Controller
@Slf4j
public class NoticeController {
	
	@Autowired NoticeFileService noticeFileService;
	@Autowired NoticeService noticeService;
	
	// 공지사항 목록 페이지
	@GetMapping("/notice/getNoticeList")
	public String getNoticeList(@RequestParam(required = false) String divisionCode, @RequestParam(required = false) String searchTitle, Model model) {
		
		log.debug(TeamColor.KMJ+"[NoticeController - getNoticeList]");
		
		Map<String, Object> paramMap = new HashMap<>();
		
		// 부서 카테고리
		if(divisionCode != null && !divisionCode.isEmpty()) {
			paramMap.put("division", divisionCode);
		
		}else {
			log.debug(TeamColor.KMJ+ "division : " + divisionCode);
			paramMap.put("division", null);
		}
		
		// 검색어 
		if(searchTitle != null && !searchTitle.isEmpty()) {
			paramMap.put("searchTitle", searchTitle);
		
		}else {
			log.debug(TeamColor.KMJ+ "searchTitle : " + searchTitle);
			paramMap.put("searchTitle", null);
		}

		// 부서 목록 가져오기
		List<Division> divisionList = noticeService.getDivisionList();
		log.debug(TeamColor.KMJ+ "divisionList : " + divisionList.toString());
		
		// 전체 공지사항 가져오기
		List<Map<String, Object>> noticeList = noticeService.getNoticeList(paramMap);
		log.debug(TeamColor.OJY+ "noticeList : " + noticeList.toString() + TeamColor.RESET);
		
		Map<String, Object> noList = new HashMap<>();
		noList.put("divisionList", divisionList);
		noList.put("noticeList", noticeList);
		noList.put("searchTitle", searchTitle);
		noList.put("division", divisionCode);
		
		model.addAttribute("noticeList", noList);
		model.addAttribute("CurrentdivisionCode", divisionCode);
		
		return "notice/noticeList";
	}
	
	// 오자윤 : /notice/noticeOne 공지사항 상세보기 (전체 조회 가능)
	@GetMapping("/notice/getNoticeOne") 
	public String getNoticeOne(@RequestParam Integer noticeNo, Model model) {
		
		log.debug(TeamColor.KMJ+"[NoticeController - getNoticeOne]");
		log.debug(TeamColor.KMJ+ "noticeNo : " + noticeNo );
	
		
		Notice notice = new Notice();
		notice.setNoticeNo(noticeNo);
		
		// 조회수 증가
		int successView = noticeService.addNoticeView(notice);
		
		if(successView != 1) { // 조회수 증가 실패
			return "redirect:/notice/getNoticeList";
		}
		
		// 게시글 가져오기
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeNo); 
		log.debug(TeamColor.OJY+ "noticeOne : " + noticeOne.toString());
		// 게시글 파일 가져오기
		List<NoticeFile> noticeFileList = noticeFileService.getNoticeFileList(noticeNo); 
		log.debug(TeamColor.OJY+ "파일 가져오기------> " + noticeFileList.toString());
		
		model.addAttribute("noticeOne", noticeOne);		
		model.addAttribute("noticeFileList", noticeFileList);		
		
		return "notice/noticeOne";
	}
	

	// 오자윤 : /notice/noticeOne 공지사항 삭제 (관리자만 삭제 가능)
	@PostMapping("/notice/noticeRemove")
	public String getNoticeRemove(Authentication auth, Model model, HttpSession session, @RequestParam(required = false) Integer noticeNo) {
			// 관리자 조회를 위한 empNo 가져오기
		    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		    String roleName = empUserDetails.getRoleNameo();
		    
		    // 권한에 따라 접근 제어
		    if ("ROLE_EMP".equals(roleName)) {
		        return "redirect:/notice/getNoticeList"; // 직원 권한일 경우 공지사항 목록으로 리다이렉트
		    } else if ("ROLE_ADMIN".equals(roleName)) {
		    
			String path = session.getServletContext().getRealPath("/noticeFile/");
			noticeService.removeNotice(noticeNo, path);
		    }
		    
	    return "redirect:/notice/getNoticeList";
	}
	
	// 오자윤 : /notice/addNotice 폼
	@GetMapping("/notice/addNotice")
	public String addNotice(Model model, Authentication auth) {
		
		// 관리자 권한 확인
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String roleName = empUserDetails.getRoleNameo();
	    
		 // 권한에 따라 접근 제어
			/*
			 * if ("ROLE_EMP".equals(roleName)) { return "redirect:/notice/getNoticeList";
			 * // 직원 권한일 경우 공지사항 목록으로 리다이렉트 } else if ("ROLE_ADMIN".equals(roleName)) {
			 */     // 부서 목록 가져오기
	        List<Division> divisionList = noticeService.getDivisionList();

	        model.addAttribute("divisionList", divisionList);
	        //return "notice/addNotice"; // 관리자 권한일 경우 공지사항 작성 페이지로 이동
	   		//}
	    
		return "notice/addNotice";
	}
	
	// 오자윤 : /notice/addNotice 공지사항 추가 (관리자만 작성 가능)
	@PostMapping("/notice/addNotice")
	public String addNotice(HttpSession session, Authentication auth, Notice notice, NoticeFile noticeFile, Employee employee, Model model) {
	    // 관리자 권한 확인
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String writerEmpNo = empUserDetails.getUsername();
	    notice.setWriterEmpNo(writerEmpNo); // 로그인된 관리자 empNo 저장
	    
		// noticeFile이 null인지 체크
	    if (noticeFile != null && noticeFile.getNoticeFile() != null) {
	    	List<MultipartFile> noticeFileList = noticeFile.getNoticeFile();
	    	log.debug(TeamColor.OJY + "noticeFileList.size() : " + noticeFileList.size() + TeamColor.RESET); // 파일 사이즈
	       
	        // 내용만 입력하고 파일이 첨부되지 않은 경우
	        if (noticeFileList.isEmpty()) {
	        	String path = null;
	        	
        	 // 1. 공지사항 저장
    	    log.debug(TeamColor.OJY + "notice------> " + notice + TeamColor.RESET); // 파일 사이즈
            noticeService.addNotice(notice, noticeFile, path);
            return "redirect:/notice/getNoticeList";
        	}
	        
	        // 파일이 첨부된 경우
	        String path = session.getServletContext().getRealPath("/noticeFile/");
	        noticeService.addNotice(notice, noticeFile, path);
	        
	        log.debug(TeamColor.OJY + "notice------>" + notice + TeamColor.RESET); // 파일 사이즈
	        log.debug(TeamColor.OJY + "noticeFile------>" + noticeFile + TeamColor.RESET); // 파일 사이즈
	        log.debug(TeamColor.OJY + "path------>" + path + TeamColor.RESET); // 파일 사이즈
	        
	        log.debug(TeamColor.OJY + "noticeService------>" + noticeService + TeamColor.RESET); // 파일 사이즈
	        log.debug(TeamColor.OJY + "path------>" + path + TeamColor.RESET); // 파일 사이즈
	        
    		}	else {
    			
    		// 파일이 첨부되지 않은 경우
    		String path = null;
    		noticeService.addNotice(notice, noticeFile, path);
    		
    		log.debug(TeamColor.OJY + "noticeService------>" + noticeService + TeamColor.RESET); // 파일 사이즈
  	        log.debug(TeamColor.OJY + "path------>" + path + TeamColor.RESET); // 파일 사이즈
  	        
      		
    		}
    	
	    return "redirect:/notice/getNoticeList";
	}
	
}
