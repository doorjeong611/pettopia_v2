package com.example.pettopia.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.employee.EmployeeMapper;
import com.example.pettopia.message.MessageMapper;
import com.example.pettopia.message.MessageService;
import com.example.pettopia.util.TeamColor;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class NotificationRest {
	
	@Autowired EmployeeMapper employeeMapper;
	@Autowired MessageMapper messageMapper;
	@Autowired MessageService messageService;
	
	
	@GetMapping("/rest/notReadYet")
	public String getNotReadYet(Authentication auth) {

		log.debug(TeamColor.KMJ+" NotificationRest : GET getNotReadYet()" + TeamColor.RESET);
		
		// 로그인 한 사원의 사번
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		Map<String, Object> notReadYet = employeeMapper.selectNotReadYet(empNo);
		
		String notReadYetCount =  String.valueOf(notReadYet.get("notReadYet"));
		log.debug(TeamColor.KMJ+" notReadYetCount "+ notReadYetCount + TeamColor.RESET);

		return notReadYetCount;
	}
	
	
	@GetMapping("/rest/messageNotiList")
	public List<Map<String, Object>> getMessageNotiList(Authentication auth) {
		
		log.debug(TeamColor.KMJ+" NotificationRest : GET getMessageNotiList()" + TeamColor.RESET);
		
		// 로그인 한 사원의 사번
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		
		List<Map<String, Object>> messageList = messageService.getNotReadMessageList(empNo);
		log.debug(TeamColor.KMJ+" messageList : " + messageList.toString() + TeamColor.RESET);
		
		return messageList;
	}
	
	
	
	
	
	
	
	
	
	

}
