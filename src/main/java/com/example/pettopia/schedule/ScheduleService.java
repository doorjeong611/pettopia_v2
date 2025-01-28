package com.example.pettopia.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Schedule;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class ScheduleService {
	
	@Autowired ScheduleMapper scheduleMapper;

	// scheduleCalendar → 캘린더 일정 조회하기
	public List<Map<String , Object>> getScheduleList(String empNo, String scheduleType){
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("empNo", empNo);
		paramMap.put("scheduleType", scheduleType);
		
		List<Map<String, Object>> scheduleList = scheduleMapper.selectScheduleList(paramMap);
	    log.debug(TeamColor.KDH + "scheduleList: " + scheduleList + TeamColor.RESET); // 추가한 로그
		
	    return scheduleList;
	}
	
	// scheduleCalendar → 캘린더 일정 추가하기
	public Integer addSchedule(Schedule schedule) {
		return scheduleMapper.insertSchedule(schedule);
	}
	
	// scheduleCalendar → 캘린더 일정 삭제하기
    public Integer removeSchedule(Integer scheduleNo) throws Exception {
    	return scheduleMapper.deleteSchedule(scheduleNo);
    }
	
	// scheduleCalendar → 캘린더 일정 수정하기
    public Integer modifySchedule(Schedule schedule) throws Exception {
    	return scheduleMapper.updateSchedule(schedule);
    }
	
}
