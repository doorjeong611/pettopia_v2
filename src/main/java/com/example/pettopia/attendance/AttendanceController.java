package com.example.pettopia.attendance;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Attendance;
import com.example.pettopia.vo.Employee;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;



@Slf4j
@Controller
public class AttendanceController {
	@Autowired 
	AttendanceSerivce attendanceService;
	
	// 오자윤 : /common/petTopiaMain 출근등록
	@PostMapping("/employee/attendanceOn")
	public String attendanceOn(Model model, HttpSession session, Attendance attendance, Authentication auth) {
		
		// Security 회원정보 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
	    String empNo = empUserDetails.getUsername(); // 또는 empUserDetails.getEmpNo() 사용 가능
	    String empEmail = empUserDetails.getEmpEmail();

	    log.debug(TeamColor.OJY + "empNo------>" + empNo + TeamColor.RESET);
	    attendance.setEmpNo(empNo);
		// 현재 날짜 및 시간 설정
	    String currentDate = LocalDate.now().toString(); 
	    String currentTime = LocalTime.now().toString(); 

	    attendance.setAttendanceDate(currentDate); // 출근 날짜 설정
	    log.debug(TeamColor.OJY + "attendanceDate------>" + attendance.getAttendanceDate() + TeamColor.RESET);
	    attendance.setClockInTime(currentTime); // 출근 시간 설정
	    
	    // 출근 기록 조회
	    List<Attendance> attendanceList = attendanceService.getAttendance(attendance);
	    log.debug(TeamColor.OJY + "attendanceList------>" + attendanceList + TeamColor.RESET);
	    // 출근 상태 결정
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
	        

	        // 출근 기록이 없는 경우
	        if (attendanceList != null && attendanceList.isEmpty()) {
	            if (startTime.isBefore(nineAmStart)) {
	                attendance.setAttendanceStatus("P"); // 출근
	            } else if (startTime.isAfter(nineAmStart) && startTime.isBefore(sixPmEnd)) {
	                attendance.setAttendanceStatus("L"); // 지각
	            } else {
	                attendance.setAttendanceStatus("E"); // 조퇴
	            }
	        } else {
	            // 출근 기록이 있는 경우
	            attendance.setAttendanceStatus("A"); // 결근
	        }
	    }
	    
	    // 출근등록 : insertAttendanceOn 쿼리실행
		attendanceService.attendanceOn(attendance);
		log.debug(TeamColor.OJY + "attendance------> " + attendance + TeamColor.RESET);
		
		 // 출퇴근 기록 다시 조회
	    attendanceList = attendanceService.getAttendance(attendance);
	    
	    model.addAttribute("attendanceList", attendanceList);
		return "common/petTopiaMain";
	}
	
	// 오자윤 : /common/petTopiaMain 퇴근등록
    @PostMapping("/employee/attendanceOff")
    public String attendanceOff(Model model, HttpSession session, Attendance attendance, Authentication auth) {
        // Security를 통해 empNo 가져오기
        EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
        String empNo = empUserDetails.getUsername(); // 또는 empUserDetails.getEmpNo() 사용 가능
        log.debug(TeamColor.OJY + "empNo------>" + empNo + TeamColor.RESET);
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

        // 출퇴근 기록 조회
        attendance.setAttendanceDate(LocalDate.now().toString()); // 오늘 날짜설정
        List<Attendance> attendanceList = attendanceService.getAttendance(attendance);
        model.addAttribute("attendanceList", attendanceList);
        log.debug(TeamColor.OJY + "attendanceList------> " + attendanceList + TeamColor.RESET);
        return "common/petTopiaMain";
    }
    
    // 오자윤 : 관리자 - 직원 근태조회
    @GetMapping("employee/attendanceList")
    public String getAttendanceListByAdmin(Model model, Attendance attendance) {
    	
        // 직원 근태 상태 카운트 조회
    	Map<String, Object> employeeStatusCount = attendanceService.countEmployeeStatus(attendance);
    	
        model.addAttribute("presentEmployee", employeeStatusCount.get("P"));
        model.addAttribute("absentCount", employeeStatusCount.get("A"));
        model.addAttribute("annualLeaveCount", employeeStatusCount.get("V"));
        model.addAttribute("halfDayLeaveCount", employeeStatusCount.get("H"));
    	// 출석 목록 조회
    	List<Attendance> attendanceList = attendanceService.getAttendance(attendance);
    	model.addAttribute("attendanceList", attendanceList);
    	
        return "employee/attendanceList";
    }
    
}
    
