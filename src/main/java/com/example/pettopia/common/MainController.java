package com.example.pettopia.common;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.attendance.AttendanceSerivce;
import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.dto.EmpUserDetailsService;
import com.example.pettopia.employee.EmployeeService;
import com.example.pettopia.message.MessageMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Attendance;
import com.example.pettopia.vo.Schedule;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
	@Autowired AttendanceSerivce attendanceService;
	@Autowired EmployeeService employeeService;
	@Autowired MainService mainService;
	@Autowired MessageMapper messageMapper;
	
	// 메인 페이지 Form
	@GetMapping("/common/petTopiaMain")
	public String mainPage(Model model, Attendance attendance, Authentication auth) {
		
		// login -> empStatus가 'T'라면 비밀번호 변경 alert 띄우기. -> 비밀번호 변경하면 'E'로 수정 하기
		EmpUserDetails emp = (EmpUserDetails)auth.getPrincipal();
		String empStatus = emp.getEmpStatus();
		log.debug(TeamColor.OJY + "empStatus------> " + empStatus + TeamColor.RESET);
		model.addAttribute("empStatus", empStatus);
		if(empStatus != null && empStatus.equals("T")) {
			String changePwMsg = "비밀번호를 수정하세요!";
			
			model.addAttribute("changePwMsg", changePwMsg);
		}

		// security 회원정보 가져오기.
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		attendance.setEmpNo(empNo);
		
		// 로그인한 회원 정보 
		Map<String, Object> empInfo = employeeService.getEmployeeOne(empNo);
		log.debug(TeamColor.KMJ+" empInfo : "+ empInfo.toString() + TeamColor.RESET);
		
		model.addAttribute("empInfo", empInfo);
		
		/*** 오자윤 : 출퇴근 기록 조회 ***/
		// 현재 날짜 설정
	    String currentDate = LocalDate.now().toString(); 
	    attendance.setAttendanceDate(currentDate); // 출근 날짜 설정
		
		// 출근날짜 currentDate 설정.
		attendance.setAttendanceDate(currentDate); 
		List<Attendance> attendanceList = attendanceService.getAttendance(attendance);
		log.debug(TeamColor.OJY + "attendanceList------> " + attendanceList + TeamColor.RESET);
		model.addAttribute("attendanceList", attendanceList);
		
		/*** 오늘 일정 리스트 ***/
		List<Schedule> todayScheduleByAllDay = mainService.getTodayScheduleByAllDay(empNo);
		if(todayScheduleByAllDay != null) {
			model.addAttribute("todayScheduleByAllDay", todayScheduleByAllDay);
			log.debug(TeamColor.KDH + "todayScheduleByAllDay : " + todayScheduleByAllDay.toString() + TeamColor.RESET);
		}
		
		/*** 안 읽은 쪽지 조회 ***/
		List<Map<String, Object>> messageList = messageMapper.selectMessageNoti(empNo);
		EmpUserDetailsService empDetail = new EmpUserDetailsService();
		
		List<Map<String, Object>> messageListByMain = new ArrayList<>();
		   
	    if (!messageList.isEmpty()) { // 메시지가 있다면 실행, 없으면 빈 리스트 전달
	    	messageListByMain = empDetail.processMessageList(messageList); 
	    	model.addAttribute("messageListByMain", messageListByMain);
	    	log.debug(TeamColor.KDH + "messageListByMain : " + messageListByMain.toString() + TeamColor.RESET);
	    }
	    
		return "common/petTopiaMain";
	}
}
