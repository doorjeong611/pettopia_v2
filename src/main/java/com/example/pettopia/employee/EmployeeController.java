package com.example.pettopia.employee;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

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


	@GetMapping("/admin/addEmployee")
	public String addEmployee() {
		log.debug(TeamColor.KMJ+"[EmployeeController - GET addEmployee()]");
		
		return "common/addEmployee";
	}
	
	
	// 직원 등록 
	@PostMapping("/admin/addEmployee")
	public String addEmployee(EmployeeForm employeeForm,  HttpSession session) {
		
		log.debug(TeamColor.KMJ+"[EmployeeController - POST addEmployee()]");
		log.debug(TeamColor.KMJ + "employeeForm :  " + employeeForm.toString());
	
		String path = session.getServletContext().getRealPath("/employeeFile/");

		// 임시 비밀번호 설정 (uuid + !) -> 총 8자리
		String tempPw = UUID.randomUUID().toString().replace("-", "").substring(0, 7)+"!";
		log.debug(TeamColor.KMJ + "--- 임시 비밀번호 설정 --- " + tempPw);
				
		employeeForm.setEmpPw(tempPw);
		
		log.debug(TeamColor.KMJ + "비밀번호 추가 후 employeeForm :  " + employeeForm.toString());
		

		// 등록 
		boolean addResult = employeeService.addEmployee(employeeForm, path);
		
		// 등록에 성공하면 메일 보내기
		if(addResult) { // 등록 성공 = true
			// 이메일 전송에 필요한 정보 : 사번, 이름, 임시비밀번호, 이메일
			Employee employee = new Employee();
			employee.setEmpNo(employeeForm.getEmpNo());
			employee.setEmpPw(tempPw);
			employee.setEmpName(employeeForm.getEmpName());
			employee.setEmpEmail(employeeForm.getEmpEmail());
			
			boolean sendMailResult = employeeService.sendMailEmployeeInfo(employee);
			
			if(sendMailResult == false) {// 메일 전송 실패시 
				log.debug(TeamColor.KMJ + "실패 ! 직원 리스트로 이동");
				log.debug(TeamColor.KMJ + "sendMailResult" + sendMailResult);
				return "common/employeeList";
			}
			
			
		}

		
		return "common/employeeList";
	}
	

	
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam String empNo, @RequestParam String empPw, Model model) {
		
		model.addAttribute("empNo", empNo);
		model.addAttribute("empPw", empPw);
		
		return "common/changePassword";
	}
	
	@GetMapping("/employeeList")
	public String getMethodName() {
		return "employee/employeeList";
	}
	
	
	
	
	
	

}
