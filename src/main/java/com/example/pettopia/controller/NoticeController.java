package com.example.pettopia.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.service.NoticeService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Notice;



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
		for(int i=0; i<divisionList.size(); i++) {
			String divisionNames = divisionList.get(i).getDivisionName();
			
			int dIndex = divisionNames.indexOf("부서"); // 부서명까지만 자르기 위해 '부서'의 위치 index 찾기.
			
			if(dIndex != -1){ // 전체 공지 제외
				String dName = divisionNames.substring(0, dIndex);
//				log.debug(TeamColor.KMJ + "부서명 : " + dName);
				divisionList.get(i).setDivisionName(dName);
				
			}
			
		}

		// 전체 공지사항 가져오기
		List<Map<String, Object>> noticeList = noticeService.getNoticeList(paramMap);
		log.debug(TeamColor.KMJ+ "noticeList : " + noticeList.toString() + TeamColor.RESET);
		
		// 부서 이름 수정 : 부서명 [부서(부서 영어명)]부분 삭제하기.
		List<String> divisionNames = new ArrayList<>(); 
		for(int i=0; i<noticeList.size(); i++) {
			divisionNames.add((String)noticeList.get(i).get("divisionName"));
//			log.debug((String)noticeList.get(i).get("divisionName"));
		}		
		
		for(int i=0; i<divisionNames.size(); i++) {
			
			int dIndex = divisionNames.get(i).indexOf("부서"); // 부서명까지만 자르기 위해 '부서'의 위치 index 찾기.
			
			if(dIndex != -1){ // 전체 공지 제외
				String dName = divisionNames.get(i).substring(0, dIndex);
//				log.debug(TeamColor.KMJ + dName);
				noticeList.get(i).put("divisionName", dName);
				
			}
			
		}
		log.debug(TeamColor.KMJ+ "noticeList 부서명 수정 후 : " + noticeList.toString() + TeamColor.RESET);

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
			return "redirect:/notice/noticeList";
		}
		
		// 해당 공지사항 가져오기
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeNo); 
		log.debug(TeamColor.KMJ+ "noticeOne : " + noticeOne.toString());
		
		// 부서 이름 수정
		if(noticeOne.get("divisionName") != null) {
			String dName = (String) noticeOne.get("divisionName");
			int dIndex = dName.indexOf("(");
			dName = dName.substring(0, dIndex);
			log.debug(TeamColor.KMJ+ "부서 이름 : " + dName + TeamColor.RESET);
			
			noticeOne.put("divisionName", dName);
			log.debug(TeamColor.KMJ+ "부서 이름 수정 후  : " + noticeOne.toString() + TeamColor.RESET);
		}
		model.addAttribute("noticeOne", noticeOne);		
		return "notice/noticeOne";
	}
	

	// 공지사항 작성 
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "notice/addNotice";
	}
	
	
	
	
	
	
	
	
	
}
