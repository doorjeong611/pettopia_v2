package com.example.pettopia.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;




@Controller
@Slf4j
public class NoticeController {
	
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
		
		// 부서명 수정
//		for(int i=0; i<divisionList.size(); i++) {
//			String divisionNames = divisionList.get(i).getDivisionName();
//			
//			int dIndex = divisionNames.indexOf("부서"); // 부서명까지만 자르기 위해 '부서'의 위치 index 찾기.
//			
//			if(dIndex != -1){ // 전체 공지 제외
//				String dName = divisionNames.substring(0, dIndex);
////				log.debug(TeamColor.KMJ + "부서명 : " + dName);
//				divisionList.get(i).setDivisionName(dName);
//				
//			}
//			
//		}

		// 전체 공지사항 가져오기
		List<Map<String, Object>> noticeList = noticeService.getNoticeList(paramMap);
		log.debug(TeamColor.KMJ+ "noticeList : " + noticeList.toString() + TeamColor.RESET);
		
		// 부서 이름 수정 : 부서명 [부서(부서 영어명)]부분 삭제하기.
//		List<String> divisionNames = new ArrayList<>(); 
//		for(int i=0; i<noticeList.size(); i++) {
//			divisionNames.add((String)noticeList.get(i).get("divisionName"));
////			log.debug((String)noticeList.get(i).get("divisionName"));
//		}		
//		
//		for(int i=0; i<divisionNames.size(); i++) {
//			
//			int dIndex = divisionNames.get(i).indexOf("부서"); // 부서명까지만 자르기 위해 '부서'의 위치 index 찾기.
//			
//			if(dIndex != -1){ // 전체 공지 제외
//				String dName = divisionNames.get(i).substring(0, dIndex);
////				log.debug(TeamColor.KMJ + dName);
//				noticeList.get(i).put("divisionName", dName);
//				
//			}
//			
//		}
//		log.debug(TeamColor.KMJ+ "noticeList 부서명 수정 후 : " + noticeList.toString() + TeamColor.RESET);

		Map<String, Object> noList = new HashMap<>();
		noList.put("divisionList", divisionList);
		noList.put("noticeList", noticeList);
		noList.put("searchTitle", searchTitle);
		noList.put("division", divisionCode);
		
		model.addAttribute("noticeList", noList);
		model.addAttribute("CurrentdivisionCode", divisionCode);
		
		return "notice/noticeList";
	}
	
	// 공지사항 상세보기
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
		
		// 해당 공지사항 가져오기
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeNo); 
		log.debug(TeamColor.KMJ+ "noticeOne : " + noticeOne.toString());
		
		// 부서 이름 수정
//		if(noticeOne.get("divisionName") != null) {
//			String dName = (String) noticeOne.get("divisionName");
//			int dIndex = dName.indexOf("(");
//			dName = dName.substring(0, dIndex);
//			log.debug(TeamColor.KMJ+ "부서 이름 : " + dName + TeamColor.RESET);
//			
//			noticeOne.put("divisionName", dName);
//			log.debug(TeamColor.KMJ+ "부서 이름 수정 후  : " + noticeOne.toString() + TeamColor.RESET);
//		}
		model.addAttribute("noticeOne", noticeOne);		
		return "notice/noticeOne";
	}
	

	// 오자윤 : /notice/addNotice 공지사항 작성 (관리자만 작성 가능)
	@GetMapping("/notice/addNotice")
	public String addNotice(Authentication auth, Employee employee) {
		
		// 관리자 조회를 위한 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
	    String empNo = empUserDetails.getUsername(); 
	    String empEmail = empUserDetails.getEmpEmail();
	    String roleName = empUserDetails.getRoleNameo();
	    
	    // 권한에 따라 접근 제어
	    if ("ROLE_EMP".equals(roleName)) {
	        return "redirect:/notice/getNoticeList"; // 직원 권한일 경우 공지사항 목록으로 리다이렉트
	    } else if ("ROLE_ADMIN".equals(roleName)) {
	        return "notice/addNotice"; // 관리자 권한일 경우 공지사항 작성 페이지로 이동
	    }
	    
	    return "redirect:/notice/getNoticeList";
	}
	
	// 오자윤 : /notice/addNotice 공지사항 추가
	@PostMapping("/notice/addNotice")
	public String addNoticeSubmit(@ModelAttribute Notice notice, @RequestParam(value = "file", required = false) MultipartFile file, Authentication auth) {
	    // 관리자 권한 확인
	    EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
	    String writerEmpNo = empUserDetails.getUsername();

	    // 1. 공지사항 저장
	    notice.setWriterEmpNo(writerEmpNo); // 로그인된 관리자 empNo 저장
	    noticeService.insertNotice(notice);

	    // 2. 첨부파일 처리 (파일이 있으면)
	    if (file != null && !file.isEmpty()) {
	        // 파일 저장 처리
	        String originalFileName = file.getOriginalFilename();
	        String generatedFileName = UUID.randomUUID().toString() + "_" + originalFileName;
	        String fileExtension = FilenameUtils.getExtension(originalFileName);

	        // 파일 저장 로직 (서버 또는 클라우드 저장소에 저장)

	        // 파일 DB에 저장 (NoticeFile 객체 생성 후 DB 저장)
	        NoticeFile noticeFile = new NoticeFile();
	        noticeFile.setOriginFileName(originalFileName);
	        noticeFile.setFileName(generatedFileName);
	        noticeFile.setFileExt(fileExtension);
	        noticeFile.setFileType(file.getContentType());

	        // Mapper를 통해 DB에 파일 정보 저장
	        noticeService.insertNoticeFile(noticeFile);
	    }

	    return "redirect:/notice/noticeList"; // 공지사항 목록으로 리다이렉트
	}
	
	
}
