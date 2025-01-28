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
		 		@RequestParam(defaultValue = "1") int page, 
	            @RequestParam(defaultValue = "10") int size) {
	    	
			// Security 회원정보 empNo 가져오기
			EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		    String empNo = empUserDetails.getUsername(); 
		    
		    // Check if startDate or endDate are empty strings and set them to null
		    if (startDate != null && startDate.isEmpty()) {
		        startDate = null;
		    }
		    if (endDate != null && endDate.isEmpty()) {
		        endDate = null;
		    }
		    
	        // 페이징 계산
	        int offset = (page -1) * size;
	        
	        // 파라미터 생성
	        Map<String, Object> params = new HashMap<>();
	        params.put("empNo", empNo);
	        params.put("startDate", startDate);
	        params.put("endDate", endDate);
	        params.put("limit", size);
	        params.put("offset", offset);
	        
	        // 휴가 목록 & 카운트 가져오기
	        List<Map<String, Object>> vacationList = vacationRecordService.getVacationListByDate(params);
	        int totalRecords = vacationRecordService.countVacationByDate(params);
	        log.debug(TeamColor.OJY + "vacationList------> " + vacationList + TeamColor.RESET);
	        
	        // 결과 맵 생성
	        Map<String, Object> result = new HashMap<>();
	        result.put("vacationList", vacationList);
	        result.put("totalRecords", totalRecords);
	        result.put("currentPage", page);
	        result.put("totalPages", (int) Math.ceil((double) totalRecords / size));		
			 
			return result;
	    }
	    
}
