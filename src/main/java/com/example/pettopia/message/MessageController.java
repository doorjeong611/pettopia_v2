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

import jakarta.servlet.http.HttpSession;


@Slf4j
@Controller
public class MessageController {
	@Autowired MessageService messageService;
	
	
@PostMapping("/message/messageBin")
public String messageBin(HttpSession session, @RequestParam(value="messageNo",required=false) ArrayList<String> messageNo) {
	// Employee loginEmp = (Employee) session.getAttribute("loginEmp");
	
	log.debug(TeamColor.OJY + "messageNo------>" + messageNo + TeamColor.RESET);
		messageService.moveToBin(messageNo);
	
	return "redirect:/message/messageList";
}

	
@PostMapping("/message/readMessage")
public String readMessage(HttpSession session, String messageNo) {
	Employee loginEmp = (Employee) session.getAttribute("loginEmp");
	String empNo = loginEmp.getEmpNo();

    // 읽음 상태로 변경
    messageService.markAsRead(messageNo);
    return "redirect:/message/messageList";
}

	
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

}
