package com.example.pettopia.employee;

import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@Slf4j
public class EmployeeController {
	
	
	
	
	@GetMapping("/admin/addEmployee")
	public String addEmployee() {
		return new String();
	}
	
	

}
