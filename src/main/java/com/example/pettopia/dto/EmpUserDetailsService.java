package com.example.pettopia.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.pettopia.employee.EmployeeMapper;
import com.example.pettopia.message.MessageMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpUserDetailsService implements UserDetailsService {

	@Autowired EmployeeMapper employeeMapper;
	@Autowired MessageMapper messageMapper;

	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
		Employee employee = employeeMapper.selectEmployeeInfo(empNo);
		Map<String, Object> empFile = employeeMapper.selectEmployeeOne(empNo);
		Map<String, Object> notReadYet = employeeMapper.selectNotReadYet(empNo);
		
		// 헤더 messageNotification
	    List<Map<String, Object>> messageList = messageMapper.selectMessageNoti(empNo);
	    List<Map<String, Object>> messageNotiList = new ArrayList<>();

	   
	    if (!messageList.isEmpty()) { // 메시지가 있다면 실행, 없으면 빈 리스트 전달
	        messageNotiList = processMessageList(messageList); 
	    }
		
		

		EmpUserDetails details = new EmpUserDetails(employee, empFile, notReadYet, messageNotiList);
		log.debug(TeamColor.KMJ + "details:--------------"+details.toString() + TeamColor.RESET);
		
		
		return details;
	}
	
	private List<Map<String, Object>> processMessageList(List<Map<String, Object>> messageList) {
		
				List<Map<String, Object>> messageNotiList = new ArrayList<>();
				
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
				
				return messageNotiList;
				
				
				
				
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
