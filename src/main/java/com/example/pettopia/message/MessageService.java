package com.example.pettopia.message;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.util.Page;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MessageService {
	@Autowired MessageMapper messageMapper;
	
	// 오자윤 : /message/messagList&Bin 쪽지 카운팅(페이징) -->
	public int countMessage(Map<String, Object> params) {
		return messageMapper.countMessage(params);
	}
	
	// 오자윤 : /message/messagList 고객이메일 검색
	public List<Map<String, Object>> searchMessages(String searchQuery) {
		return messageMapper.searchMessages(searchQuery);
	}
	
	// 오자윤 : /message/messageNote 쪽지보내기 -->
	public void sendMessage(Message message) {
		messageMapper.insertMessage(message);
	} 
	
	// 오자윤 : /message/messageNote 팀 검색 (쪽지쓰기 모달창) -->
	public List<Department> getDepartmentName(String divisionCode) {
		return messageMapper.selectDeparmentNameInModal(divisionCode);
	} 
	
	// 오자윤 : /message/messageNote 부서검색 (쪽지쓰기 모달창) -->
	public List<Division> getDivisionName () {
		return messageMapper.selectDivisionNameInModal();
	}
	
	// 오자윤 : /message/messageBin 쪽지보관함으로 복구하기
	public Integer restoreMessage(List<Long> messageNo) {
		return messageMapper.restoreMessage(messageNo);
	}
	
	// 오자윤 : /message/messageBin 휴지통 영구삭제 -->
	public Integer deleteMessage(List<Integer> messageNo) {
		return messageMapper.deleteMessage(messageNo);
	}
	
	// 오자윤 : /employee/messageNote (모달)직원 조회 -->
	public List<Map<String, Object>> getEmployeeList(String empStatus, String deptCode, String empName) {
		return messageMapper.getEmployeeList(empStatus, deptCode, empName);
	}

	// 오자윤 : /message/messageOne 쪽지 상세보기 페이지
	public Map<String, Object> getMessageById(String messageNo) {
	    return messageMapper.getMessageById(messageNo); // 새로운 메서드
	}
	
	// 오자윤 : /message/messageList 쪽지리스트 조횐
	public List<Map<String, Object>> getMessageList(Map<String, Object> params) {
		return messageMapper.getMessageList(params);
	}
	
	// 오자윤 : /message/messageList 쪽지리스트 조횐
	public List<Map<String, Object>> getMessageBin(Map<String, Object> params) {
		return messageMapper.getMessageBin(params);
	}

	
	// 오자윤 : /message/messageList 쪽지 휴지통 이동 -->
	public void moveToBin(List<String> messageNo) { 
		for(String result : messageNo) {
			messageMapper.updateMessage(result);
		}
	}
	
	// 오자윤 : /message/messageList 메시지 읽음 상태 변환 -->
	public Integer markAsRead(String messageNo) {
		return messageMapper.updateMessageState(messageNo);
	}

	
	// header.jsp : 안읽은 메세지 목록 (5개)
	public List<Map<String, Object>> getNotReadMessageList(String empNo) {
		log.debug(TeamColor.KMJ+" MessageService : getNotReadMessageList()" + TeamColor.RESET);
		
		
		// 헤더 messageNotification
	    List<Map<String, Object>> messageList = messageMapper.selectMessageNoti(empNo); // Mapper 에서 메세지 조회
	    List<Map<String, Object>> messageNotiList = new ArrayList<>();


		// 조회 데이터 가공
		// 메세지 수신 시간 계산
		LocalDateTime now = LocalDateTime.now();
		
		if(messageList.size()>5) { // 읽지 않은 메세지가 5개 초과라면 
			for(int i = 0; i < 5; i++) {
				Map<String, Object> message = new HashMap<>();
	
				message.put("messageNo", messageList.get(i).get("messageNo"));
				message.put("senderEmpNo", messageList.get(i).get("senderEmpNo"));
	            message.put("senderEmpName", messageList.get(i).get("senderEmpName"));
	            message.put("messageTitle", messageList.get(i).get("messageTitle"));
	            message.put("createDateTime", messageList.get(i).get("createDateTime"));
	            message.put("fileName", messageList.get(i).get("fileName"));
	            
	            Object createDateTimeObj = message.get("createDateTime"); // db의 createDatetime 타입 확인
	            LocalDateTime createDateTime = null;
	            
	            if (createDateTimeObj instanceof String) {// 문자열인 경우
	            	
	                String createDateTimeStr = (String) createDateTimeObj;
	                createDateTime = LocalDateTime.parse(createDateTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	                
	            } else if (createDateTimeObj instanceof LocalDateTime) { // localDatetime인 경우
	            	
	                createDateTime = (LocalDateTime) createDateTimeObj;
	            }
	            
	            
	            // 시간 차이 계산
	            long hoursDiff = ChronoUnit.HOURS.between(createDateTime, now);
	            long daysDiff = ChronoUnit.DAYS.between(createDateTime, now);

	            // 시간에 따라 메세지 알림 설정
	            if (hoursDiff < 1) {// 1시간 이내
	            	message.put("arrivalAlert", "1Hour");
	            } else if (hoursDiff < 2) {// 2시간 이내
	            	message.put("arrivalAlert", "2Hour");
	            } else if (daysDiff < 1) {// 오늘 
	            	message.put("arrivalAlert", "Today");
	            } else if (daysDiff < 2) {// 어제
	            	message.put("arrivalAlert", "Yesterday");
	            } else {// 그 이상
	            	message.put("arrivalAlert", "DaysAgo");
	            }

	            messageNotiList.add(message);
				
			}

		}else {// 읽지 않은 메세지가 5개 이하라면
			
			for(int i = 0; i < messageList.size(); i++) {
				Map<String, Object> message = new HashMap<>();
	
				message.put("messageNo", messageList.get(i).get("messageNo"));
				message.put("senderEmpNo", messageList.get(i).get("senderEmpNo"));
	            message.put("senderEmpName", messageList.get(i).get("senderEmpName"));
	            message.put("messageTitle", messageList.get(i).get("messageTitle"));
	            message.put("createDateTime", messageList.get(i).get("createDateTime"));
	            message.put("fileName", messageList.get(i).get("fileName"));
	            
	            
	            Object createDateTimeObj = message.get("createDateTime"); // db의 createDatetime 타입 확인
	            LocalDateTime createDateTime = null;
	            
	            if (createDateTimeObj instanceof String) {
	                String createDateTimeStr = (String) createDateTimeObj;
	                createDateTime = LocalDateTime.parse(createDateTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	            } else if (createDateTimeObj instanceof LocalDateTime) {
	                createDateTime = (LocalDateTime) createDateTimeObj;
	            }
	            
	            // 시간 차이 계산
	            long hoursDiff = ChronoUnit.HOURS.between(createDateTime, now);
	            long daysDiff = ChronoUnit.DAYS.between(createDateTime, now);

	            // 시간에 따라 메세지 알림 설정
	            if (hoursDiff < 1) {// 1시간 이내
	            	message.put("arrivalAlert", "1Hour");
	            } else if (hoursDiff < 2) {// 2시간 이내
	            	message.put("arrivalAlert", "2Hour");
	            } else if (daysDiff < 1) {// 오늘 
	            	message.put("arrivalAlert", "Today");
	            } else if (daysDiff < 2) {// 어제
	            	message.put("arrivalAlert", "Yesterday");
	            } else {// 그 이상
	            	message.put("arrivalAlert", "DaysAgo");
	            }

	            messageNotiList.add(message);
				
			}
			
		}
		
		log.debug(TeamColor.KMJ+" messageNotiList "+ messageNotiList.toString() + TeamColor.RESET);
		
		
		return messageNotiList;

		
	}
	
	
	
	
	
}
