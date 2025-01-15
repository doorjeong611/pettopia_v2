package com.example.pettopia.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MessageMapper {
	
	// 오자윤 : /employee/messageBin 쪽지보관함으로 복구하기
	Integer restoreMessage(List<Long> messageNo);
	
	// 오자윤 : /employee/messageBin 휴지통 영구삭제
	Integer deleteMessage(List<Integer> messageNo);
	
	// 오자윤 : /employee/messageNote (모달)직원 조회 
	List<Map<String, Object>> getEmployeeList(String empStatus);
	
	// 오자윤 : /employee/messageOne 쪽지 상세보기
	Map<String, Object>getMessageById(String messageNo);
	
	// 오자윤 : /employee/messageList 쪽지리스트
	List<Map<String, Object>>getMessageList(String empNo);
	
	// 오자윤 : /employee/messageList 쪽지 휴지통 이동
	Integer updateMessage(String messageNo);
	
	// 오자윤 : /employee/messageList 메시지 읽음 상태 변환
	Integer updateMessageState(String message);
	
}
