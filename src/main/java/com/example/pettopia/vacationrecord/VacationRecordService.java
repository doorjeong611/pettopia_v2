package com.example.pettopia.vacationrecord;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VacationRecordService {
	@Autowired VacationRecordMapper vacationRecordMapper;
	
	// 오자윤 : /vacation/vacationList (페이징) 휴가 카운팅 REST-->
	public int countVacationByDate(Map<String, Object> params){
		return vacationRecordMapper.countVacationByDate(params);
	}
	
	// 오자윤 : /vacation/vacationList 휴가 날짜검색 REST -->
	public List<Map<String, Object>> getVacationListByDate(Map<String, Object> params){ 
		return vacationRecordMapper.getVacationListByDate(params);
	}
	
	// 오자윤 : /vacation/vacationList 직원 휴가 카운팅 -->
	public int countVacation(Map<String, Object> params) {
		return vacationRecordMapper.countVacation(params);
	}
	
	// 오자윤 : /vacation/vacationList 직원 휴가 카운팅 -->
	public Map<String, Object> getVacationCount(String empNo) {
		return vacationRecordMapper.getVacationCount(empNo);
	}
	
	// 오자윤 : /vacation/vacationList 직원 휴가 사용내역 -->
	public List<Map<String, Object>> getVacationUsage(Map<String, Object> params) {
		return vacationRecordMapper.getVacationUsage(params);
		
	}
}
