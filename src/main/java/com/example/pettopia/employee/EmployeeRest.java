package com.example.pettopia.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class EmployeeRest {
	
	@Autowired EmployeeService employeeService;

	// employeeList : 직원 목록 조회 
	@GetMapping("/rest/employeeList/{divisionCode}")
	public List<Map<String, Object>> employeeList(@PathVariable(required = false) String divisionCode, Authentication auth) {
		
		log.debug(TeamColor.KMJ+" EmployeeRest : GET employeeList()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" divisionCode : " + divisionCode + TeamColor.RESET);
		
		
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("empNo", empNo);
		
		// 공백일때 전체 목록 
		if (divisionCode == null || divisionCode == "") {
	        paramMap.put("divisionCode", null); // 전체 검색
	    } else {
	        paramMap.put("divisionCode", divisionCode);
	    }
		
		
		List<Map<String, Object>> empList = employeeService.getEmployeeList(paramMap);
		log.debug(TeamColor.KMJ + "empList [0]" + empList.get(0).toString());
		
		
		return empList;
	}


}
