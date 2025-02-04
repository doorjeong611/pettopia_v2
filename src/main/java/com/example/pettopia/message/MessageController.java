package com.example.pettopia.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Message;

@Slf4j
@Controller
public class MessageController {
	@Autowired MessageService messageService;
	
	// 오자윤 : /employee/messageNote 쪽지 전송
	@PostMapping("/message/sendMessage")
	public String sendMessage(@RequestParam("emp_No")String empNo, @RequestParam("title")String messageTitle, @RequestParam("content")String messageContent,Authentication auth, Message message) {
		log.debug(TeamColor.OJY + "empNo------>" + empNo + TeamColor.RESET);
		
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		String senderEmpNo = empUserDetails.getUsername();
		
		message.setSenderEmpNo(senderEmpNo); // 발신자
		message.setRecipientEmpNo(empNo); // 수신자
		message.setMessageTitle(messageTitle);
		message.setMessageContent(messageContent);
		
		messageService.sendMessage(message);
		return  "redirect:/message/messageNote";
	}
	
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
	
	// 오자윤 : /employee/messageList 쪽지 목록 조회
	@GetMapping("message/messageList")
	public String getMethodName(Authentication auth, Model model, @RequestParam(defaultValue = "1") Integer currentPage,
																@RequestParam(defaultValue = "10") Integer size,
														        @RequestParam(required = false) String searchKeyword)	{
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		log.debug(TeamColor.OJY + "empUserDetails------>" + empUserDetails + TeamColor.RESET);
		String empNo = empUserDetails.getUsername();
	
		 // 페이지네이션 유효성 검사
	    if (currentPage < 1) {
	        currentPage = 1; // 기본값
	    }
	    if (size < 1 || size > 100) { // 최대 100개
	        size = 10; // 기본값
	    }
	    
	    // 전체 메시지 개수 가져오기
	    Map<String, Object> params = new HashMap<>();
	    params.put("empNo", empNo);
	    params.put("searchKeyword", searchKeyword);
	    params.put("message_bin", "0");
	    
	    int totalRecords = messageService.countMessage(params); // 메시지 총 개수
	    int totalPages = (int) Math.ceil((double) totalRecords / size); // 전체 페이지 수
	    log.debug(TeamColor.OJY + "totalRecords------>" + totalRecords + TeamColor.RESET);
	    
	    // 페이지 오프셋 계산
	    int offset = (currentPage - 1) * size;
	    if (offset < 0) {
	        offset = 0; // OFFSET이 음수가 되지 않도록 설정
	    }
	    
	    // 페이지 파라미터 추가
	    params.put("offset", offset);
	    params.put("limit", size);
	    
	    // 페이지 된 쪽지목록
	    List<Map<String, Object>> messageList = messageService.getMessageList(params);

	    // model 추가
	    model.addAttribute("messageList", messageList);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalResults", totalRecords);
	    model.addAttribute("searchKeyword", searchKeyword);
	    log.debug(TeamColor.OJY + "messageList------>" + messageList + TeamColor.RESET);
	    
	    return "message/messageList";
	}
	
    // 오자윤 : /message/messageNote 쪽지 쓰기 페이지
    @GetMapping("message/messageNote")
    public String writeMessage(@RequestParam(required = false) String recipientName,
    						   @RequestParam(required = false) String recipientEmpNo, Model model,
    						   Authentication auth) {
        
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		log.debug(TeamColor.OJY + "empUserDetails------>" + empUserDetails + TeamColor.RESET);
		String empNo = empUserDetails.getUsername();
		
    	// recipientName 변수로 받아서 답장하기.
        model.addAttribute("recipientName", recipientName);
        model.addAttribute("recipientEmpNo", recipientEmpNo);
        model.addAttribute("empNo", empNo);
    	
        return "message/messageNote"; 
    }

	// 오자윤 : /employee/messageBin 휴지통 페이지
	@GetMapping("message/messageBin")
	public String messageBin(Authentication auth, Model model,
							@RequestParam(defaultValue = "1") Integer currentPage,
							@RequestParam(defaultValue = "10") Integer size, 
							@RequestParam(required = false) String searchKeyword)	{
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		log.debug(TeamColor.OJY + "empUserDetails------>" + empUserDetails + TeamColor.RESET);
		String empNo = empUserDetails.getUsername();
	
		 // 페이지네이션 유효성 검사
	    if (currentPage < 1) {
	        currentPage = 1; // 기본값
	    }
	    if (size < 1 || size > 100) { // 최대 100개
	        size = 10; // 기본값
	    }
	    
	    // 전체 메시지 개수 가져오기
	    Map<String, Object> params = new HashMap<>();
	    params.put("empNo", empNo);
	    params.put("searchKeyword", searchKeyword);
	    params.put("message_bin", "1");
	    
	    int totalRecords = messageService.countMessage(params); // 메시지 총 개수
	    int totalPages = (int) Math.ceil((double) totalRecords / size); // 전체 페이지 수

	    // 페이지 오프셋 계산
	    int offset = (currentPage - 1) * size;
	    if (offset < 0) {
	        offset = 0; // OFFSET이 음수가 되지 않도록 설정
	    }
	    
	    // 페이지 파라미터 추가
	    params.put("offset", offset);
	    params.put("limit", size);
	    
		// 쪽지 목록 조회
		List<Map<String, Object>> messageList = messageService.getMessageBin(params);
		model.addAttribute("messageList", messageList);
		log.debug(TeamColor.OJY + "messageList------>" + messageList + TeamColor.RESET);
		
		 // model 추가
	    model.addAttribute("messageList", messageList);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalResults", totalRecords);
	    model.addAttribute("searchKeyword", searchKeyword);
	    
		return "message/messageBin";
	}
	
	// 오자윤 : /employee/messageBin 휴지통 영구삭제 -->
	@PostMapping("message/messageDelete")
	public String messageBin(@RequestParam List<Integer> messageNo, Authentication auth, Model model,  @RequestParam(required = false) String searchKeyword) {
		
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		log.debug(TeamColor.OJY + "empUserDetails------>" + empUserDetails + TeamColor.RESET);
		String empNo = empUserDetails.getUsername();
		
		// 휴지통 영구삭제
		messageService.deleteMessage(messageNo);
		log.debug(TeamColor.OJY + "messageNo------>" + messageNo + TeamColor.RESET);
		
	    // 쪽지 목록 조회를 위한 파라미터 설정
	    Map<String, Object> params = new HashMap<>();
	    params.put("empNo", empNo);
	    params.put("searchKeyword", searchKeyword);
	    
	    // 페이지네이션 기본값 설정
	    int size = 10;
	    int offset = 0; 
	    params.put("limit", size);
	    params.put("offset", offset);

		// 쪽지 목록 조회
		List<Map<String, Object>> messageList = messageService.getMessageList(params);
		model.addAttribute("messageList", messageList);
		
		return "redirect:/message/messageBin";
	}
	
	// 오자윤 : /employee/messageBin 메시지 보관함 복구 -->
	@PostMapping("message/messageRestore")
	public String messageRestore(@RequestParam List<Long> messageNo, Authentication auth, Model model, @RequestParam(required = false) String searchKeyword) {
		log.debug(TeamColor.OJY + "messageNo------>" + messageNo + TeamColor.RESET);
		 
		// 시큐리티 empNo 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		log.debug(TeamColor.OJY + "empUserDetails------>" + empUserDetails + TeamColor.RESET);
		String empNo = empUserDetails.getUsername();
		
		// 쪽지보관함 복원 
		messageService.restoreMessage(messageNo);
		
		// 쪽지 목록 조회를 위한 파라미터 설정
	    Map<String, Object> params = new HashMap<>();
	    params.put("empNo", empNo);
	    params.put("searchKeyword", searchKeyword);
	  
	    // 페이지네이션 기본값 설정
	    int size = 10; 
	    int offset = 0;
	    params.put("limit", size);
	    params.put("offset", offset);

		// 쪽지 목록 조회
		List<Map<String, Object>> messageList = messageService.getMessageList(params);
		model.addAttribute("messageList", messageList);
		
		return "redirect:/message/messageBin";
	}
	
	
	// 오자윤 : /employee/messageOne 쪽지 상세보기 페이지
	@GetMapping("message/messageOne")
	public String messageOne(@RequestParam String messageNo, Model model) {
		
		// 단일 메시지 조회
		Map<String, Object> selectedMessage = messageService.getMessageById(messageNo);
		log.debug(TeamColor.OJY + "selectedMessage------>" + selectedMessage + TeamColor.RESET);
		
		
		// message_state 'N' -> 'Y'로 변경
		String messageState = (String)selectedMessage.get("messageState");
		
		if(messageState.equalsIgnoreCase("N")) {// 메시지 읽음으로 변경하기
			messageService.markAsRead(messageNo);
		}
		
		model.addAttribute("selectedMessage",selectedMessage);
		
		return "message/messageOne";
		
	}
	
}
	
	
