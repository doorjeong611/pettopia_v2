package com.example.pettopia.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.service.AttendanceSerivce;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Attendance;
import com.example.pettopia.vo.Employee;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
	@Autowired AttendanceSerivce attendanceService;
	
	// 오자윤 : 출퇴근 기록 조회
	@GetMapping("/common/petTopiaMain")
	public String mainPage(Model model, Attendance attendance, HttpSession session) {
		//세션 가져오기.
		Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		String empNo = loginEmp.getEmpNo();
		attendance.setEmpNo(empNo);
		
		// 현재 날짜 설정
	    String currentDate = LocalDate.now().toString(); 
	    attendance.setAttendanceDate(currentDate); // 출근 날짜 설정
		
		// 출근날짜 currentDate 설정.
		attendance.setAttendanceDate(currentDate); 
		    
		List<Attendance> attendanceList = attendanceService.getAttendance(attendance);
		log.debug(TeamColor.OJY + "attendanceList------> " + attendanceList + TeamColor.RESET);
		
		model.addAttribute("attendanceList", attendanceList);
		return "common/petTopiaMain";
	}
}
