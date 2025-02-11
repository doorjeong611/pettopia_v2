package com.example.pettopia.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 로그인 폼으로 이동
	@GetMapping({"/","/login"})
	public String login(Authentication authentication, HttpSession session) {
		
		if (authentication != null && authentication.isAuthenticated()) {
            // 이미 로그인된 사용자가 로그인 페이지로 접근하려고 하면 홈 페이지로 리다이렉트
            return "redirect:/common/petTopiaMain";
        }
		
		return "login/login";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(Model model) {
			
		
		return "login/login";
	}
	
	// 에러페이지
	@GetMapping("/errorPage")
	public String error() {
		log.debug(TeamColor.KMJ+"00000000000" + TeamColor.RESET);
		return "common/404";
	}
	

	
	
	
	
}
