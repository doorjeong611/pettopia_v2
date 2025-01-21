package com.example.pettopia.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Message;
import com.example.pettopia.vo.Rank;


@Mapper
public interface MessageMapper {
	
	// 오자윤 : 페이지네이션 총 total count 
	Integer getMessageCount(String empNo);
	
	// 오자윤 : /employee/messageNote 쪽지보내기
	void insertMessage(Message message);
	
	// 오자윤 : /employee/messageNote 팀 검색 (쪽지쓰기 모달창) -->
	List<Department> selectDeparmentNameInModal(String divisionCode);
	
	// 오자윤 : /employee/messageNote 부서검색 (쪽지쓰기 모달창) -->
	List<Division> selectDivisionNameInModal ();
	
	// 오자윤 : /employee/messageBin 쪽지보관함으로 복구하기
	Integer restoreMessage(List<Long> messageNo);
	
	// 오자윤 : /employee/messageBin 휴지통 영구삭제
	Integer deleteMessage(List<Integer> messageNo);
	
	// 오자윤 : /employee/messageNote (모달)직원 조회 
	List<Map<String, Object>> getEmployeeList(String empStatus, String deptCode, String empName);
	
	// 오자윤 : /employee/messageOne 쪽지 상세보기
	Map<String, Object>getMessageById(String messageNo);
	
	
	// 오자윤 : /employee/messageList 쪽지리스트
	List<Map<String, Object>>getMessageList(String empNo, int limit, int offset);
	
	// 오자윤 : /employee/messageList 쪽지 휴지통 이동
	Integer updateMessage(String messageNo);
	
	// 오자윤 : /employee/messageList 메시지 읽음 상태 변환
	Integer updateMessageState(String message);
	
}
