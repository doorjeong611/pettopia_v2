package com.example.pettopia.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.pettopia.service.AttendanceSerivce;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Attendance;
import com.example.pettopia.vo.Employee;

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
		// 세션 empNo 가져오기
		public String attendanceOn(Model model, HttpSession session, Attendance attendance) {
		Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		log.debug(TeamColor.OJY + "loginEmp------>" + loginEmp + TeamColor.RESET);
		String empNo = loginEmp.getEmpNo();
		log.debug(TeamColor.OJY + "empNo------>" + empNo + TeamColor.RESET);
		attendance.setEmpNo(empNo);
		
		// 현재 날짜 및 시간 설정
	    String currentDate = LocalDate.now().toString(); 
	    String currentTime = LocalTime.now().toString(); 

	    attendance.setAttendanceDate(currentDate); // 출근 날짜 설정
	    attendance.setClockInTime(currentTime); // 출근 시간 설정
	    
	    // 출근 상태 결정 로직
	    String attendanceStatus = attendance.getAttendanceStatus(); // 연차/반차/출근 상태

	    if ("연차".equals(attendanceStatus)) {
	        attendance.setAttendanceStatus("V"); // 연차
	    } else if ("반차".equals(attendanceStatus)) {
	        attendance.setAttendanceStatus("H"); // 반차
	    } else {
	        // 기본 출근 상태 설정
	        LocalTime startTime = LocalTime.parse(currentTime);
	        LocalTime nineAmStart = LocalTime.of(9, 0);
	        LocalTime sixPmEnd = LocalTime.of(18, 0);
	        
	        // 출근 기록 조회
	        Integer attendanceCount = attendanceService.getAttendance(attendance);

	        // 출근 기록이 있는 경우
	        if (attendanceCount != null && attendanceCount >= 0) {
	            if (startTime.isBefore(nineAmStart)) {
	                attendance.setAttendanceStatus("P"); // 출근
	            } else if (startTime.isAfter(nineAmStart) && startTime.isBefore(sixPmEnd)) {
	                attendance.setAttendanceStatus("L"); // 지각
	            } else {
	                attendance.setAttendanceStatus("E"); // 조퇴
	            }
	        } else {
	            // 출근 기록이 없는 경우
	            attendance.setAttendanceStatus("A"); // 결근
	        }
	    }
	    
	    // 출근등록 : insertAttendanceOn 쿼리실행
		attendanceService.attendanceOn(attendance);
		log.debug(attendance.toString() + "------> attendance");
		return "redirect:/common/petTopiaMain";
	}
	
	// 오자윤 : 퇴근등록
    @PostMapping("/employee/attendanceOff")
    public String attendanceOff(Model model, HttpSession session, Attendance attendance) {
    	// 세션 empNo 가져오기
    	Employee loginEmp = (Employee) session.getAttribute("loginEmp");
    	log.debug(TeamColor.OJY + "loginEmp------> in attendanceOff" + loginEmp + TeamColor.RESET);
		String empNo = loginEmp.getEmpNo();
		log.debug(TeamColor.OJY + "empNo------> empNo" + loginEmp + TeamColor.RESET);
		attendance.setEmpNo(empNo);
		
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
            attendance.setAttendanceStatus("L"); // 지각
        } else if ("조퇴".equals(attendanceStatus)) {
            attendance.setAttendanceStatus("E"); // 조퇴
        } else {
            attendance.setAttendanceStatus("P"); // 정상출근
        }

        // 퇴근등록 : insertAttendanceOff 쿼리실행
        attendanceService.attendanceOff(attendance);

        return "redirect:/common/petTopiaMain";
    }
    
    // 오자윤 : 출근 기록 보여주기 
//    @GetMapping("/common/petTopiaMain")
//    public String getAttendanceListByEmployee(Model model, HttpSession session) {
//    	// 로그인한 직원 정보 가져오기
//        Employee loginEmp = (Employee) session.getAttribute("loginEmp");
//
//    	  // Attendance 객체를 생성하고 사원 번호를 설정
//        Attendance attendance = new Attendance();
//        attendance.setEmpNo(loginEmp.getEmpNo()); // 사원 번호 설정
//
//        // 출퇴근 기록 조회
//        List<Attendance> attendanceList = new ArrayList<>();
//        attendanceService.getAttendance(attendance);
//        // 모델에 출퇴근 기록 추가
//        model.addAttribute("attendanceList", attendanceList);
//        
//        return "employee/attendanceList"; 
//    }
}
