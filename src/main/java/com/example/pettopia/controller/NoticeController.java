package com.example.pettopia.controller;

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



@Controller
@Slf4j
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	
	
	// 공지사항 페이지로 이동
	@GetMapping("/notice/getNoticeList")
	public String getNoticeList(@RequestParam(required = false) String division, @RequestParam(required = false) String searchTitle, Model model) {
		
		log.debug(TeamColor.KMJ+"[NoticeController - getNoticeList]");
		
		Map<String, Object> paramMap = new HashMap<>();
		
		// 부서 카테고리
		if(division != null && !division.isEmpty()) {
			paramMap.put("division", division);
		
		}else {
			log.debug(TeamColor.KMJ+ "division : " + division);
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
		log.debug(TeamColor.KMJ+ "noticeList : " + noticeList.toString() + TeamColor.RESET);
		
		Map<String, Object> noList = new HashMap<>();
		noList.put("divisionList", divisionList);
		noList.put("noticeList", noticeList);
		noList.put("searchTitle", searchTitle);
		noList.put("division", division);
		
		model.addAttribute("noticeList", noList);
		
		return "notice/noticeList";
	}
	
	
	

}
