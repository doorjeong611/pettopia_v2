package com.example.pettopia.vacationrecord;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VacationRecordMapper {
	
	// 오자윤 : /vacation/vacationList 직원 휴가 카운팅 -->
	int countVacation(Map<String, Object> params);
	
	// 오자윤 : /vacation/vacationList 직원 휴가 카운팅 -->
	Map<String, Object> getVacationCount(String empNo);
	
	// 오자윤 : /vacation/vacationList 직원 휴가 사용내역 -->
	List<Map<String, Object>> getVacationUsage(Map<String, Object> params);
	
}
