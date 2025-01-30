package com.example.pettopia.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RestController
public class MessageRest {
	@Autowired MessageService messageService;
	
	// 오자윤 : /message/messageList 쪽지 검색.
	@GetMapping("message/search")
	public List<Map<String, Object>> searchMessages(@RequestParam(required = false) String searchQuery) {
		return messageService.searchMessages(searchQuery); // JSON 응답 반환
	}
	
	// 오자윤 : /message/messageNote 팀 검색 (쪽지쓰기 모달창) -->
	@GetMapping("message/departmentList/{divisionCode}")
	public List<Department> getDepartmentName(@PathVariable String divisionCode) {
		return messageService.getDepartmentName(divisionCode);
	}
	
	// 오자윤 : /message/messageNote 부서검색 (쪽지쓰기 모달창) -->
	@GetMapping("message/divisionList")
	public List<Division> getDivisionNameInModal() {
		return messageService.getDivisionName();
	}
	
	// 오자윤 : /message/messageNote 직원리스트 반환 (쪽지쓰기 모달창)
	@GetMapping("message/messageNote/employees")
	public List<Map<String, Object>> employeeList
		(@RequestParam(value = "empStatus", defaultValue = "E") String empStatus, 
		 @RequestParam(value = "deptCode", required = false) String deptCode,
		 @RequestParam(value = "empName", required = false) String empName,
		 @RequestParam(value = "limit", defaultValue = "10") Integer limit,
		 @RequestParam(value = "offset", defaultValue = "0") Integer offset,
		 Model model) {
		
		  // 파라미터를 맵에 담기
	    Map<String, Object> params = new HashMap<>();
	    params.put("empStatus", empStatus);
	    params.put("deptCode", deptCode);
	    params.put("empName", empName);
	    params.put("limit", limit);
	    params.put("offset", offset);
	 
	    // 직원 리스트 조회
	    List<Map<String, Object>> employeeList = messageService.getEmployeeList(params);
	    log.debug(TeamColor.OJY + "Employee List: " + employeeList + TeamColor.RESET);
	    
	    return employeeList;
	}
	
}
