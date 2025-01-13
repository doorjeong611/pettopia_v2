package com.example.pettopia.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeForm;

import jakarta.servlet.http.HttpSession;


@Controller
@Slf4j
public class EmployeeController {
	
	@Autowired EmployeeService employeeService;
	

//	@GetMapping("/admin/addEmployee") 로그인 정상적으로되면 다시 되돌리기... addEmployee.jsp도 employee 폴더로 옮기기
	@GetMapping("/addEmployee")
	public String addEmployee() {
		log.debug(TeamColor.KMJ+"[EmployeeController - GET addEmployee()]");
		
		return "common/addEmployee";
	}
	
	
	// 직원 등록 
	@PostMapping("/addEmployee")
	public String addEmployee(EmployeeForm employeeForm,  HttpSession session) {
		
		log.debug(TeamColor.KMJ+"[EmployeeController - POST addEmployee()]");
		log.debug(TeamColor.KMJ + "employeeForm :  " + employeeForm.toString());
	
		String path = session.getServletContext().getRealPath("/employeeFile/");

		// 등록 
		employeeService.addEmployee(employeeForm, path);
		
		
		
		
		return "employeeList";
	}
	
	
	
	
	
	

}
