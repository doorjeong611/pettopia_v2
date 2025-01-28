package com.example.pettopia.vacationrecord;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;


@Controller
@Slf4j
public class VacationRecordController {
	@Autowired 
	VacationRecordService vacationRecordService;
	
	 @GetMapping("vacation/vacationList")
	 public String getVacationList(Authentication auth, Model model,
							 		@RequestParam(defaultValue = "1") int page, 
						            @RequestParam(defaultValue = "10") int size,
						            @RequestParam(required = false) String empName, 
									@RequestParam(required = false) String startDate,
									@RequestParam(required = false) String endDate) {
		 
		// Security 회원정보 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
	    String empNo = empUserDetails.getUsername(); 
	    
	    // 직원 휴가 정보 가져오기
        Map<String, Object> employeeVacationInfo = vacationRecordService.getVacationCount(empNo);
        
        // 직원 휴가 카운트
        model.addAttribute("totalVacationDays", employeeVacationInfo.get("total_vacation_days")); 
        model.addAttribute("usedVacationDays", employeeVacationInfo.get("used_vacation_days"));
        model.addAttribute("remainingVacationDays", employeeVacationInfo.get("remaining_vacation_days"));

        // 휴가 리스트 파라미터 생성
        Map<String, Object> params = new HashMap<>();
        params.put("empNo", empNo);
        params.put("empName", empName);
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        
        // 페이징 (전체 개수)
        int totalRecords = vacationRecordService.countVacation(params);
        // 페이징 유효성 검사
        if (page < 1) {
            page = 1; // 기본값
        }
        if (size < 1 || size > 100) { // 최대 100개
            size = 10; // 기본값
        }
        
        // 전체 페이지
        int totalPages = (int) Math.ceil((double) totalRecords / size);
        // 시작 페이지 계산
        int offset = (page - 1) * size;
        if (offset < 0) {
            offset = 0; // OFFSET이 음수가 되지 않도록 설정
        }
        
        // 페이지 파라미터
        params.put("offset", offset);
        params.put("limit", size);
        
		// 휴가 리스트
        List<Map<String, Object>> vacationList = vacationRecordService.getVacationUsage(params);
        log.debug(TeamColor.OJY + "vacationList------> " + vacationList + TeamColor.RESET);
        
        // 직원리스트, 직원출석, 페이징
        model.addAttribute("vacationList", vacationList);
        model.addAttribute("empName", empName);
        model.addAttribute("empNo", empNo);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalResults", totalRecords);
        
        return "vacation/vacationList";
	 }
	 
}
