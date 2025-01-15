package com.example.pettopia.message;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MessageService {
	@Autowired MessageMapper messageMapper;
	
	// 오자윤 : /employee/messageBin 쪽지보관함으로 복구하기
	public Integer restoreMessage(List<Long> messageNo) {
		return messageMapper.restoreMessage(messageNo);
	}
	
	// 오자윤 : /employee/messageBin 휴지통 영구삭제 -->
	public Integer deleteMessage(List<Integer> messageNo) {
		return messageMapper.deleteMessage(messageNo);
	}
	
	// 오자윤 : /employee/messageNote (모달)직원 조회 -->
	public List<Map<String, Object>> getEmployeeList(String empStatus) {
		return messageMapper.getEmployeeList(empStatus);
	}
	
	// 오자윤 : /employee/messageList 쪽지리스트
	public Map<String, Object> getMessageById(String messageNo) {
	    return messageMapper.getMessageById(messageNo); // 새로운 메서드
	}
	
	// 오자윤 : /employee/messageList 쪽지리스트
	public List<Map<String, Object>> getMessageList(String empNo) {
		return messageMapper.getMessageList(empNo);
	}
	
	// 오자윤 : /employee/messageList 쪽지 휴지통 이동 -->
	public void moveToBin(List<String> messageNo) { 
		for(String result : messageNo) {
			messageMapper.updateMessage(result);
		}
	}
	
	// 오자윤 : /employee/messageList 메시지 읽음 상태 변환 -->
	public Integer markAsRead(String messageNo) {
		return messageMapper.updateMessageState(messageNo);
	}

}
