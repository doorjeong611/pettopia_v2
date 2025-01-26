package com.example.pettopia.vacationrecord;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.message.MessageService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@ComponentScan("com.example.pettopia.message")
public class VacationRest {
	   	@Autowired
	    VacationRecordService vacationRecordService;
	    @Autowired
	    MessageService messageService; // 쪽지모달창 부서, 팀 검색 재활용

	    // 오자윤 : /vacation/vacationList 팀 검색 -->
		@GetMapping("vacation/departmentList/{divisionCode}")
		public List<Department> getDepartmentName(@PathVariable String divisionCode) {
			return messageService.getDepartmentName(divisionCode);
		}
		
		// 오자윤 : /vacation/vacationList 부서검색 -->
		@GetMapping("vacation/divisionList")
		public List<Division> getDivisionName() {
			return messageService.getDivisionName();
		}
		
	    // 휴가리스트 반환 : /vacation/attendanceList 근태리스트 반환 (임시)
	    @GetMapping("rest/vacation/vacationList")
	    public List<Map<String, Object>> attendanceList(
	            @RequestParam(required = false) String attendanceDate,
	            @RequestParam(required = false) String deptCode,
	            @RequestParam(required = false) String divisionCode,
	            @RequestParam(required = false) String empName,
	            @RequestParam(defaultValue = "0") int offset,
	            @RequestParam(defaultValue = "10") int limit) {
	    	
	        // 쿼리 파라미터 추가
	        Map<String, Object> params = new HashMap<>();
	        params.put("attendanceDate", attendanceDate);
	        params.put("deptCode", deptCode);
	        params.put("divisionCode", divisionCode);
	        params.put("empName", empName);
	        params.put("offset", offset);
	        params.put("limit", limit);

			 // 디버깅
			 List<Map<String, Object>> vacationList = vacationRecordService.getVacationUsage(params);
			 log.debug(TeamColor.OJY + "vacationList: " + vacationList + TeamColor.RESET);
			 
	        // 직원리스트 반환
	        return vacationRecordService.getVacationUsage(params);
	    }
	    
}
