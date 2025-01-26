package com.example.pettopia.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.vo.Schedule;

@Service
@Transactional
public class ScheduleService {
	
	@Autowired ScheduleMapper scheduleMapper;

	// scheduleCalendar → 캘린더 일정 조회하기
	public List<Map<String , Object>> getScheduleList(String empNo){
		return scheduleMapper.selectScheduleList(empNo);
	}
	
	// scheduleCalendar → 캘린더 일정 추가하기
	public Integer addSchedule(Schedule schedule) {
		return scheduleMapper.insertSchedule(schedule);
	}
	
	// scheduleCalendar → 캘린더 일정 삭제하기
//    public void calendarDelete(String no) throws Exception {
//        calendarMapper.calendarDelete(no);
//    }
	
	// scheduleCalendar → 캘린더 일정 수정하기
//    public void eventUpdate(CalendarVo vo) throws Exception {
//        calendarMapper.eventUpdate(vo);
//    }
	
}
