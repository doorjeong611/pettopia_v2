package com.example.pettopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.service.AttendanceSerivce;
import com.example.pettopia.vo.Attendance;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
	@Autowired AttendanceSerivce attendanceService;
	
	// 오자윤 : 출퇴근 기록 조회
	@GetMapping("/common/petTopiaMain")
	public String mainPage(Model model, Attendance attendnace) {
		List<Attendance> attendanceList = attendanceService.getAttendance(attendnace);
		
		model.addAttribute("attendanceList", attendanceList);
		return "common/petTopiaMain";
	}
}
