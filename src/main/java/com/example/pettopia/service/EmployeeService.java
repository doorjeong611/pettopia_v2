package com.example.pettopia.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.mapper.EmployeeMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class EmployeeService {
	
	@Autowired EmployeeMapper employeeMapper;
	
	
	// 로그인
	public Map<String, Object> getEmployeeInfo(Employee employee) {
		
		log.debug(TeamColor.KMJ+"[EmployeeService - getEmployeeInfo]");
		log.debug(TeamColor.KMJ+ "empNo : " + employee.getEmpNo());
		log.debug(TeamColor.KMJ+ "password : " + employee.getEmpPw());
		
		Employee loginEmp = employeeMapper.selectEmployeeInfo(employee);
		
		boolean loginFlag = false;
		Map<String, Object> login = new HashMap<>();

		
		// 로그인 성공 
		if(loginEmp != null && !loginEmp.getEmpStatus().equals("R")) { // 사번과 비밀번호가 db 정보와 일치하고 퇴사자가 아닌 직원
			log.debug(TeamColor.KMJ+ "loginEmp.getEmpStatus() : " + loginEmp.getEmpStatus() + TeamColor.RESET);
			loginFlag = true;
			login.put("loginEmp", loginEmp); // 로그인 성공한 사원의 정보 담기
			login.put("loginFlag", loginFlag);
			
			return login;
		}
		
		// 로그인 실패
		login.put("loginFlag", loginFlag);
		
		return login;
		
				
	}
	
	
	
	

}
