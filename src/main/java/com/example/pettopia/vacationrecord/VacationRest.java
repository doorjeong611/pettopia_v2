package com.example.pettopia.vacationrecord;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class VacationRest {
	   	@Autowired
	    VacationRecordService vacationRecordService;

	    // 휴가리스트 날짜 검색 : /vacation/vacationList 
	    @GetMapping("rest/vacation/vacationList")
	    public Map<String, Object> attendanceList(Authentication auth,
	            @RequestParam(required = false) String startDate,
	            @RequestParam(required = false) String endDate,
	            @RequestParam(defaultValue = "1") Integer currentPage,
				@RequestParam(defaultValue = "10") Integer size) {
	    	
			// Security 회원정보 empNo 가져오기
			EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		    String empNo = empUserDetails.getUsername(); 
	        
	        // 휴가 리스트 파라미터 생성
	        Map<String, Object> params = new HashMap<>();
	        params.put("empNo", empNo);
	        params.put("startDate", startDate);
	        params.put("endDate", endDate);
	        
	        // 페이징 유효성 검사
	        if (currentPage < 1) {
	        	currentPage = 1; // 기본값
	        }
	        if (size < 1 || size > 100) { // 최대 100개
	        	size = 10; // 기본값
	        }
	        
	        // 페이징 (전체 개수)
	        int totalRecords = vacationRecordService.countVacation(params);
	        // 전체 페이지
	        int totalPages = (int) Math.ceil((double) totalRecords / size);
	        
	        // 시작 페이지 계산
	        int offset = (currentPage - 1) * size;
	        if (offset < 0) {
	            offset = 0; 
	        }
	       
	        // 페이지 파라미터
	        params.put("limit", size);
	        params.put("offset", offset);
	        
	        // 휴가 리스트
	        List<Map<String, Object>> vacationList = vacationRecordService.getVacationListByDate(params);
	        
	        // 결과 맵 생성
	        Map<String, Object> result = new HashMap<>();
	        result.put("vacationList", vacationList);
	        result.put("totalResults", totalRecords);
	        result.put("currentPage", currentPage);
	        result.put("totalPages", totalPages);		
			
	        log.debug(TeamColor.OJY + "limit------> " + vacationList + TeamColor.RESET);
	        log.debug(TeamColor.OJY + "offset------> " + vacationList + TeamColor.RESET);
	       
			return result;
	    }
	    
}
