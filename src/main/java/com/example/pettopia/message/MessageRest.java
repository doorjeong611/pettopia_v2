package com.example.pettopia.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Rank;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RestController
public class MessageRest {
	@Autowired MessageService messageService;
	
	// 오자윤 : /employee/messageNote 팀 검색 (쪽지쓰기 모달창) -->
	@GetMapping("message/departmentList/{divisionCode}")
	public List<Department> getDepartmentName(@PathVariable String divisionCode) {
		return messageService.getDepartmentName(divisionCode);
	}
	
	// 오자윤 : /employee/messageNote 부서검색 (쪽지쓰기 모달창) -->
	@GetMapping("message/divisionList")
	public List<Division> getDivisionNameInModal() {
		return messageService.getDivisionName();
	}
	
	// 오자윤 : /employee/messageNote 직원리스트 반환 (쪽지쓰기 모달창)
	@GetMapping("message/messageNote/employees")
	public List<Map<String, Object>> employeeList
		(@RequestParam(value = "empStatus", defaultValue = "E") String empStatus, 
		 @RequestParam(value = "deptCode", required = false) String deptCode,
		 Model model) {
		
		//디버깅
		 List<Map<String, Object>> employeeList = messageService.getEmployeeList(empStatus, deptCode);
		 log.debug(TeamColor.OJY + "Employee List: " + employeeList + TeamColor.RESET);
		 
		return messageService.getEmployeeList(empStatus, deptCode);
	}
	
}
