package com.example.pettopia.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.Message;

@Service
public class MessageService {
	@Autowired MessageMapper messagemapper;
	
	// // 오자윤 : /employee/messageList 쪽지리스트
	public List<Message> getMessageList(String empNo) {
		return messagemapper.getMessageList(empNo);
	}
	
}
