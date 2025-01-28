package com.example.pettopia.schedule;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.dto.EmpUserDetails;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ScheduleController {
	
	// scheduleCalendar Form
	@GetMapping("/schedule/scheduleCalendar")
	public String scheduleCalendar(Model model, Authentication authentication) {
		
		EmpUserDetails empUserDetails = (EmpUserDetails)authentication.getPrincipal();
		String empNo = empUserDetails.getUsername();
		model.addAttribute("empNo", empNo);
		
		return "schedule/scheduleCalendar";
	}
	
}
