package com.example.pettopia.vacationrecord;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VacationRecordService {
	@Autowired VacationRecordMapper vacationRecordMapper;
	
	// 오자윤 : /vacation/vacationList 직원 휴가 카운팅 -->
	public Integer getVacationCount(String empNo) {
		return vacationRecordMapper.getVacationCount(empNo);
	}
	
	// 오자윤 : /vacation/vacationList 직원 휴가 사용내역 -->
	public List<Map<String, Object>> getVacationUsage(String empNo) {
		return vacationRecordMapper.getVacationUsage(empNo);
		
	}
}
