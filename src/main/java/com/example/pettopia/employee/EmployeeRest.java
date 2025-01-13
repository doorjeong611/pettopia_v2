package com.example.pettopia.employee;

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
	
	// 직원 중복 등록 검사
	@GetMapping("/common/existEmp/{employeeId}")
	public Boolean existEmp(@PathVariable String employeeId) {
		
		log.debug(TeamColor.KMJ+"[EmployeeRest - GET addEmployee()]");
		log.debug(TeamColor.KMJ + "넘어온 empNo :" + employeeId);
		
		String empNo = employeeId;
		
		Boolean result = employeeService.getExistEmployee(empNo);
		
		log.debug(TeamColor.KMJ + "empNo " + empNo + TeamColor.RESET);
		
		
		return result;
	}
	
	
	
	

}
