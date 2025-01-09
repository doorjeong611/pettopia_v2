package com.example.pettopia.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.employee.EmployeeService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@Autowired EmployeeService employeeService;
	

	@GetMapping("/login")
	public String login() {
		return "common/login";
	}
	
	
	// 로그인
	@PostMapping("/login")
	public String login(Employee employee, HttpSession session ) {
		
		
		log.debug(TeamColor.KMJ+"[LoginController - login() post]");
		log.debug(TeamColor.KMJ+ "empNo : " + employee.getEmpNo());
		log.debug(TeamColor.KMJ+ "password : " + employee.getEmpPw() + TeamColor.RESET);
	
		// login 성공 유무
		Map<String, Object> login = employeeService.getEmployeeInfo(employee);
		log.debug(TeamColor.KMJ+ "flag : " + login.get("loginFlag"));
		
		boolean loginFlag = (boolean)login.get("loginFlag");
				
		// 로그인에 성공한 경우
		if(loginFlag) {
			log.debug(TeamColor.KMJ+ "employee : " + login.get("loginEmp").toString()+ TeamColor.RESET);
			
			session.setAttribute("loginEmp", login.get("loginEmp"));
			
			return "redirect:/common/petTopiaMain";

			
			// 로그인 실패 	
		}else {
			
			
			return "redirect:/login";
		}
		

		
	}
	
	
	
	
	
	
}
