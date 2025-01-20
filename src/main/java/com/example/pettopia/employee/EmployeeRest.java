package com.example.pettopia.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class EmployeeRest {
	
	@Autowired EmployeeService employeeService;

	// employeeList : 직원 목록 조회 
	@GetMapping("/rest/employeeList/{divisionCode}")
	public List<Map<String, Object>> employeeList(@PathVariable(required = false) String divisionCode, @RequestParam(required = false) String empStatus, Authentication auth) {
		
		log.debug(TeamColor.KMJ+" EmployeeRest : GET employeeList()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" divisionCode : " + divisionCode + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empStatus : " + empStatus + TeamColor.RESET);
		
		
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		// 매개값
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("empNo", empNo);
		
		// 공백일때 전체 목록 (부서 선택)
		if (divisionCode == null || divisionCode == "") {
	        paramMap.put("divisionCode", null); // 전체 검색
	    } else {
	        paramMap.put("divisionCode", divisionCode);
	    }
		
		// 공백일때 전체 목록 (재직 상태) 
		if (empStatus == null || empStatus == "") {
			paramMap.put("empStatus", null); // 전체 검색
		} else {
			paramMap.put("empStatus", empStatus);
		}
		
		
		List<Map<String, Object>> empList = employeeService.getEmployeeList(paramMap);
		if(empList.size() >0) {
			log.debug(TeamColor.KMJ + "empList [0]" + empList.get(0).toString());			
		}else {
			log.debug(TeamColor.KMJ + "조회 결과 없음" );	
		}
		
		
		return empList;
	}
	
	

	
	
	


}
