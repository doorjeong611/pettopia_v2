package com.example.pettopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.pettopia.service.AttendanceSerivce;
import com.example.pettopia.vo.Attendance;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Slf4j
@Controller
public class AttendanceController {
	@Autowired 
	AttendanceSerivce attendanceService;
	
	// 오자윤 : 출근등록
	@PostMapping("/employee/attendanceOn")
	public String attendanceOn(Model model, Attendance attendance) {
		attendanceService.attendanceOn(attendance);
		
		log.debug(attendance.toString() + "------> attendance");
		return "redirect:/employee/attendanceList";
	}
	
	// 오자윤 : 퇴근등록
    @PostMapping("/employee/attendanceOff")
    public String attendanceOff(Model model, Attendance attendance) {
        attendanceService.attendanceOff(attendance);
        
        log.debug(attendance.toString() + "-----> attendance");
        return "redirect:/employee/attendanceList";
    }
    
    // (임시) 오자윤 : 출근 리스트 보여주기 - employee
    @GetMapping("/employee/attendanceList")
    public String getAttendanceListByEmployee(Model model) {
        
        return "employee/attendanceList"; 
    }
}
