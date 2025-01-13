package com.example.pettopia.message;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.employee.EmployeeService;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;

import jakarta.servlet.http.HttpSession;


@Slf4j
@Controller
public class MessageController {
	@Autowired MessageService messageService;
	
	// 오자윤 : /employee/messageList 휴지통으로 보내기		
	@PostMapping("/message/messageBin")
	public String messageBin(@RequestParam(value="messageNo",required=false) ArrayList<String> messageNo) {
		
		messageService.moveToBin(messageNo);
		log.debug(TeamColor.OJY + "messageNo------>" + messageNo + TeamColor.RESET);
		
		return "redirect:/message/messageList";
	}
	
	// 오자윤 : /employee/messageList 메시지 읽음 기능
	@PostMapping("/message/readMessage")
	public String readMessage(Authentication auth, String messageNo) {
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
	
	    // 읽음 상태로 변경
	    messageService.markAsRead(messageNo);
	    return "redirect:/message/messageList";
	}
	
	// 오자윤 : /employee/messageList 메시지 목록 조회
	@GetMapping("message/messageList")
	public String getMethodName(Authentication auth, Model model) {
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		log.debug(TeamColor.OJY + "empUserDetails------>" + empUserDetails + TeamColor.RESET);
		String empNo = empUserDetails.getUsername();
	
		// 쪽지 목록 조회
		List<Map<String, Object>> messageList = messageService.getMessageList(empNo);
		model.addAttribute("messageList", messageList);
		log.debug(TeamColor.OJY + "messageList------>" + messageList + TeamColor.RESET);
	    return "message/messageList";
	}
	
    // 오자윤 : /message/messageNote 쪽지 쓰기 페이지
    @GetMapping("message/messageNote")
    public String writeMessage(Model model) {
    	
        return "message/messageNote"; 
    }

    // 오자윤 : /message/messageNote/employees 모달창, 직원목록 AJAX로 가져옴
    @GetMapping("message/messageNote/employees")
    public ResponseEntity<List<Map<String, Object>>> getEmployees(@RequestParam(value = "empStatus", defaultValue = "E") String empStatus) {
    	
        List<Map<String, Object>> employeeList = messageService.getEmployeeList(empStatus);
        log.debug(TeamColor.OJY + "employeeList------>" + employeeList + TeamColor.RESET);
        return ResponseEntity.ok(employeeList); // 직원 목록을 JSON 형태로 반환
    }
    
	// 오자윤 : /employee/messageNote 휴지통 페이지
	@GetMapping("message/messageBin")
	public String messageBin(Model model) {
		
		return "message/messageBin";
		
	}
	
	// 오자윤 : /employee/messageOne 쪽지 상세보기 페이지
	@GetMapping("message/messageOne")
	public String messageOne(@RequestParam String messageNo, Model model) {
		
		// 단일 메시지 조회
		Map<String, Object> selectedMessage = messageService.getMessageById(messageNo);
		log.debug(TeamColor.OJY + "selectedMessage------>" + selectedMessage + TeamColor.RESET);
		
		model.addAttribute("selectedMessage",selectedMessage);
		
		return "message/messageOne";
		
	}
	
}
	
	
