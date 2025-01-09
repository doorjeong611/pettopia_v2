package com.example.pettopia.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Message;

@Mapper
public interface MessageMapper {
	
	// 오자윤 : /employee/messageList 쪽지리스트
	List<Message> getMessageList(String empNo);
	
}
