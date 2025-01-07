package com.example.pettopia.controller;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.pettopia.service.AttendanceSerivce;
import com.example.pettopia.vo.Attendance;

import jakarta.servlet.http.HttpSession;
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
	public String attendanceOn(Model model, HttpSession session, Attendance attendance) {
		// 세션 empNo 가져오기
		// String empNo = (String)session.getAttribute("empNo");
		// attendance.setEmpNo(empNo);
		// log.debug("attendance객체 ----->" + attendance);
		
		// 현재 날짜 및 시간 설정
	    String currentDate = LocalDate.now().toString(); 
	    String currentTime = LocalTime.now().toString(); 

	    attendance.setAttendanceDate(currentDate); // 출근 날짜 설정
	    attendance.setClockInTime(currentTime); // 출근 시간 설정
	    
	    // 출근 상태 결정 로직
	    String attendanceStatus = attendance.getAttendanceStatus(); // 연차/반차/출근 상태

	    if ("연차".equals(attendanceStatus)) {
	        attendance.setAttendanceStatus("연차");
	    } else if ("반차".equals(attendanceStatus)) {
	        attendance.setAttendanceStatus("반차");
	    } else {
	        // 기본 출근 상태 설정
	        attendance.setAttendanceStatus("출근");

	        LocalTime startTime = LocalTime.parse(currentTime);
	        LocalTime nineAmStart = LocalTime.of(9, 0);
	        LocalTime sixPmEnd = LocalTime.of(18, 0);

	        // 출근 기록이 있는 경우
	        if (attendanceService.getAttendanceStatus(attendance) > 0) {
	            if (startTime.isBefore(nineAmStart)) {
	                attendance.setAttendanceStatus("출근");
	            } else if (startTime.isAfter(nineAmStart) && startTime.isBefore(sixPmEnd)) {
	                attendance.setAttendanceStatus("지각");
	            } else {
	                attendance.setAttendanceStatus("조퇴");
	            }
	        } else {
	            // 출근 기록이 없는 경우
	            attendance.setAttendanceStatus("결근");
	        }
	    }
	    
	    // 출근등록 : insertAttendanceOn 쿼리실행
		attendanceService.attendanceOn(attendance);
		log.debug(attendance.toString() + "------> attendance");
		return "redirect:/employee/attendanceList";
	}
	
	// 오자윤 : 퇴근등록
    @PostMapping("/employee/attendanceOff")
    public String attendanceOff(Model model, HttpSession session, Attendance attendance) {
    	// 세션 empNo값 가져오기
    	// String empNo = (String) session.getAttribute(empNo);
    	// attendance.setEmpNo(empNo);
    	
    	// 퇴근 시간 설정
        String currentTime = LocalTime.now().toString(); 
        attendance.setClockOutTime(currentTime);
        
        // 퇴근 상태 설정 
        String attendanceStatus = attendance.getAttendanceStatus();
        // 기본 퇴근 상태
        if (attendanceStatus == null || attendanceStatus.isEmpty()) {
            attendanceStatus = "출근";
        }
        
        // 퇴근 상태 결정
        if ("지각".equals(attendanceStatus)) {
            attendance.setAttendanceStatus("지각"); // 지각으로 퇴근
        } else if ("조퇴".equals(attendanceStatus)) {
            attendance.setAttendanceStatus("조퇴"); // 조퇴로 퇴근
        } else {
            attendance.setAttendanceStatus("출근"); // 정상 출근으로 퇴근
        }
        
        // 퇴근등록 : insertAttendanceOff 쿼리실행
        attendanceService.attendanceOff(attendance);
        log.debug("-----> attendance 객체" + attendance.toString());
        
        return "redirect:/employee/attendanceList";
    }
    
    // (임시) 오자윤 : 출근 리스트 보여주기 - employee
    @GetMapping("/employee/attendanceList")
    public String getAttendanceListByEmployee(Model model) {
        
        return "employee/attendanceList"; 
    }
}
