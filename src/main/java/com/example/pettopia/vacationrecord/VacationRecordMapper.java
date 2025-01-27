package com.example.pettopia.vacationrecord;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VacationRecordMapper {
	
	// 오자윤 : /vacation/vacationList (페이징) 휴가 카운팅 REST-->
	int countVacationByDate(Map<String, Object> params);
	
	// 오자윤 : /vacation/vacationList 휴가 날짜검색 REST -->
	List<Map<String, Object>> getVacationListByDate(Map<String, Object> params);
	
	// 오자윤 : /vacation/vacationList (페이징) 직원 휴가 카운팅 -->
	int countVacation(Map<String, Object> params);
	
	// 오자윤 : /vacation/vacationList (페이지 상단) 직원 휴가 카운팅 -->
	Map<String, Object> getVacationCount(String empNo);
	
	// 오자윤 : /vacation/vacationList 직원 휴가 사용내역 -->
	List<Map<String, Object>> getVacationUsage(Map<String, Object> params);
	
}
