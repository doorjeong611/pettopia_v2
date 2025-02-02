package com.example.pettopia.common;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.vo.Schedule;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class MainService {
	
	@Autowired MainMapper mainMapper;
	
	public List<Schedule> getTodayScheduleByAllDay(String empNo) {
		return mainMapper.selectTodayScheduleByAllDay(empNo);
	}
	
	public List<Map<String, Object>> getNoticeListByMain() {
		return mainMapper.selectNoticeListByMain();
	}
	
	public List<Map<String, Object>> getDocumentListByMain(String empNo) {
		return mainMapper.selectDocumentListByMain(empNo);
	}
	
	public List<Map<String, Object>> getMonthlyReservationStatistics(Integer year) {
		return mainMapper.selectMonthlyReservationStatistics(year);
	}
	
	public List<Map<String, Object>> getGenderSignupStatistics(Integer year, String gender) {
		return mainMapper.selectGenderSignupStatistics(year, gender);
	}
	
	public Map<String, Object> getReservationStats() {
		return mainMapper.selectReservationStats();
	}

}
