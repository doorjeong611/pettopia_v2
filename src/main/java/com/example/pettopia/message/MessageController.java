package com.example.pettopia.message;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.Message;

import jakarta.servlet.http.HttpSession;


@Slf4j
@Controller
public class MessageController {
	@Autowired MessageService messageService;
	
	// 오자윤 : /employee/messageList 휴지통으로 보내기		
	@PostMapping("/message/messageBin")
	public String messageBin(HttpSession session, @RequestParam(value="messageNo",required=false) ArrayList<String> messageNo) {
		// Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		
		log.debug(TeamColor.OJY + "messageNo------>" + messageNo + TeamColor.RESET);
			messageService.moveToBin(messageNo);
		
		return "redirect:/message/messageList";
	}
	
	// 오자윤 : /employee/messageList 메시지 읽음 기능
	@PostMapping("/message/readMessage")
	public String readMessage(HttpSession session, String messageNo) {
		Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		String empNo = loginEmp.getEmpNo();
	
	    // 읽음 상태로 변경
	    messageService.markAsRead(messageNo);
	    return "redirect:/message/messageList";
	}
	
	// 오자윤 : /employee/messageList 메시지 목록 조회
	@GetMapping("message/messageList")
	public String getMethodName(HttpSession session, Model model) {
		// 세션 empNo 가져오기
		Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		String empNo = loginEmp.getEmpNo();
		
		// 쪽지 목록 조회
		List<Map<String, Object>> messageList = messageService.getMessageList(empNo);
		model.addAttribute("messageList", messageList);
		log.debug(TeamColor.OJY + "messageList------>" + messageList + TeamColor.RESET);
	    return "message/messageList";
	}
	
	// 오자윤 : /employee/messageNote 쪽지 쓰기 페이지
	@GetMapping("message/messageNote")
	public String writeMessage() {
		
	    return "message/messageNote";
	
	}
	
	// 오자윤 : /employee/messageNote 휴지통 페이지
	@GetMapping("message/messageBin")
	public String messageBin() {
		
		return "message/messageBin";
		
	}
	
	// 오자윤 : /employee/messageOne 쪽지 상세보기 페이지
	@GetMapping("message/messageOne")
	public String messageOne(@RequestParam String messageNo, HttpSession session, Model model) {
		Employee loginEmp = (Employee) session.getAttribute("loginEmp");
		
		// 단일 메시지 조회
		Map<String, Object> selectedMessage = messageService.getMessageById(messageNo);
		log.debug(TeamColor.OJY + "selectedMessage------>" + selectedMessage + TeamColor.RESET);
		
		model.addAttribute("selectedMessage",selectedMessage);
		
		return "message/messageOne";
		
	}
	
}
	
	
