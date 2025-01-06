package com.example.pettopia.controller;

import java.time.LocalTime;

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
		// 출근 시간 가져오기
	    String startTimeStr = attendance.getClockOutTime();
	    // 문자열 LocalDate 및 LocalTime으로 변환
	    LocalTime startTime = LocalTime.parse(startTimeStr);
	    // 출근시간 : 6AM, 퇴근시간 : 9PM
	    LocalTime nineAmStart = LocalTime.of(9, 0);
	    LocalTime sixPmEnd = LocalTime.of(18, 0);
	    
	    // 출근 상태 가져오기
	    String attendanceStatus = attendance.getAttendanceDate();
	    
	    if ("연차".equals(attendanceStatus)) {
	        attendance.setAttendanceDate("연차");
	    } else if ("반차".equals(attendanceStatus)) {
	        attendance.setAttendanceDate("반차");
	    } else if (attendanceService.getAttendanceStatus(attendance) > 0) {
	        // 출근 기록이 있는 경우
	        if (startTime.isBefore(nineAmStart)) {
	            attendance.setAttendanceDate("출근");
	        // 9시 이후 출근 & 6시 퇴근 기록 있는 경우
	        } else if (startTime.isAfter(nineAmStart) && startTime.isBefore(sixPmEnd)) { 
	            attendance.setAttendanceDate("지각");
	        } else {
	            attendance.setAttendanceDate("조퇴");
	        }	
	    // 출근 기록이 없는 경우	        
	    } else {
	        attendance.setAttendanceDate("결근");
	    }
	    
	    // 출근등록 : insertAttendanceOn 쿼리실행
		attendanceService.attendanceOn(attendance);
		log.debug(attendance.toString() + "------> attendance");
		return "redirect:/employee/attendanceList";
	}
	
	// 오자윤 : 퇴근등록
    @PostMapping("/employee/attendanceOff")
    public String attendanceOff(Model model, Attendance attendance) {
        attendanceService.attendanceOff(attendance);
    	// 퇴근 시간 가져오기
        String endTimeStr = attendance.getClockInTime(); 
        LocalTime endTime = LocalTime.parse(endTimeStr);
        
        // 퇴근 상태 설정 
        attendance.setAttendanceDate("퇴근");
        // 퇴근등록 : insertAttendanceOff 쿼리실행
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
