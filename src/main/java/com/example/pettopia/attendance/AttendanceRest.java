package com.example.pettopia.attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.message.MessageService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Attendance;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@ComponentScan("com.example.pettopia.message")
public class AttendanceRest {
    @Autowired
    AttendanceSerivce attendanceService;
    @Autowired
    MessageService messageService; // 쪽지모달창 부서, 팀 검색 재활용

	// 오자윤 : /attendance/attendanceList 팀 검색 -->
	@GetMapping("attendance/departmentList/{divisionCode}")
	public List<Department> getDepartmentName(@PathVariable String divisionCode) {
		return messageService.getDepartmentName(divisionCode);
	}
	
	// 오자윤 : /attendance/attendanceList 부서검색 -->
	@GetMapping("attendance/divisionList")
	public List<Division> getDivisionName() {
		return messageService.getDivisionName();
	}
	
    // 직원리스트 반환 : /attendance/attendanceList 근태리스트 반환
    @GetMapping("attendance/attendanceList")
    public List<Map<String, Object>> attendanceList(
            @RequestParam(required = false) String attendanceDate,
            @RequestParam(required = false) String deptCode,
            @RequestParam(required = false) String divisionCode,
            @RequestParam(required = false) String empName,
            @RequestParam(defaultValue = "1") int currentPage, 
            @RequestParam(defaultValue = "10") int size, Model model) {
    	
		// 페이지네이션 유효성 검사
	    if (currentPage < 1) {
	        currentPage = 1; // 기본값
	    }
	    if (size < 1 || size > 100) { // 최대 100개
	        size = 10; // 기본값
	    }
	    
	    Map<String, Object> params = new HashMap<>();
	    
        // 페이지 오프셋 계산
        int offset = (currentPage - 1) * size;
        if (offset < 0) {
            offset = 0; 
        }
        
        // 쿼리 파라미터 추가
        params.put("attendanceDate", attendanceDate);
        params.put("deptCode", deptCode);
        params.put("divisionCode", divisionCode);
        params.put("empName", empName);
        params.put("offset", offset);
        params.put("limit", size);
        
        // 전체 출석 수 가져오기
        int totalRecords = attendanceService.countAttendance(params); // 총 출석 수
        int totalPages = (int) Math.ceil((double) totalRecords / size);
        
		 // 디버깅
		 List<Map<String, Object>> attendanceList = attendanceService.selectAttendance(params);
		 log.debug(TeamColor.OJY + "attendanceList: " + attendanceList + TeamColor.RESET);
		 
	    // 페이지 정보 모델에 추가
	    model.addAttribute("attendanceList", attendanceList);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalRecords", totalRecords);
		    
        // 직원리스트 반환
        return attendanceList;
    }
    
    
    
	// employeeOne : 본인 출,퇴근(근태) 조회
	@GetMapping("/rest/myAttendanceList/{attendanceStatus}")
	public List<Attendance> getMyAttendanceList(Authentication auth, @PathVariable(required = false) String attendanceStatus) {
		
		log.debug(TeamColor.KMJ+" AttendanceRest : GET getMyAttendanceList()" + TeamColor.RESET);

		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		log.debug(TeamColor.KMJ+" empNo : " + empNo + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" attendanceStatus : " + attendanceStatus + TeamColor.RESET);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("empNo", empNo);
		
		// 공백일때 전체 목록 (출근 상태 선택)
		if (attendanceStatus == null || attendanceStatus == "") {
	        paramMap.put("attendanceStatus", null); // 전체 검색
	    } else {
	        paramMap.put("attendanceStatus", attendanceStatus);
	    }
		
		List<Attendance> myAttenList = attendanceService.getMyAttendanceList(paramMap);
		
		if(myAttenList.size() >0) {
			log.debug(TeamColor.KMJ + "myAttenList [0]" + myAttenList.get(0).toString());			
		}else {
			log.debug(TeamColor.KMJ + "조회 결과 없음" );	
		}
		
		return myAttenList;
	}
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
