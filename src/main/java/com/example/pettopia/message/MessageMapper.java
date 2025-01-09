package com.example.pettopia.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MessageMapper {
	
	// 오자윤 : /employee/messageList 쪽지리스트
	List<Map<String, Object>>getMessageList(String empNo);
	
}
