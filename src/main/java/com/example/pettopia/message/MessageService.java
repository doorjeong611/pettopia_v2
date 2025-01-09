package com.example.pettopia.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	@Autowired MessageMapper messagemapper;
	
	// // 오자윤 : /employee/messageList 쪽지리스트
	public List<Map<String, Object>> getMessageList(String empNo) {
		return messagemapper.getMessageList(empNo);
	}
	
}
