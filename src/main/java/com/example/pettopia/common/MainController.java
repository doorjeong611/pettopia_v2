package com.example.pettopia.common;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.attendance.AttendanceSerivce;
import com.example.pettopia.dto.EmpUserDetails;
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
	public String mainPage(Model model, Attendance attendance, Authentication auth) {
		
		// login -> empStatus가 'T'라면 비밀번호 변경 alert 띄우기. -> 비밀번호 변경하면 'E'로 수정 하기
		EmpUserDetails emp = (EmpUserDetails)auth.getPrincipal();
		String empStatus = emp.getEmpStatus();
		log.debug(TeamColor.OJY + "empStatus------> " + empStatus + TeamColor.RESET);
		
		if(empStatus != null && empStatus.equals("T")) {
			String changePwMsg = "비밀번호를 수정하세요!";
			
			model.addAttribute("changePwMsg", changePwMsg);
		}
		

		// security 회원정보 가져오기.
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
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
