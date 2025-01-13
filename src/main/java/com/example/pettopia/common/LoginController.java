package com.example.pettopia.common;

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
	

	@GetMapping("/loginForm")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "login/login";
	}
	
	@GetMapping("/errorPage")
	public String error() {
		log.debug("00000000000");
		return "common/404";
	}
	
	
	
	
	
}
