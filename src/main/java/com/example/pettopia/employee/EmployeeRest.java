package com.example.pettopia.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class EmployeeRest {
	
	@Autowired EmployeeService employeeService;
	

	
	// 직원 목록 조회 
	@GetMapping("/rest/employeeList")
	public List<Map<String, Object>> employeeList() {
		
		log.debug(TeamColor.KMJ+"[EmployeeRest - GET employeeList()]");
		
		List<Map<String, Object>> empList = employeeService.getEmployeeList();
		log.debug(TeamColor.KMJ + "empList [0]" + empList.get(0).toString());
		
		
		return empList;
	}
	
	
	
	

}
