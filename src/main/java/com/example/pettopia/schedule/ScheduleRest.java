package com.example.pettopia.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScheduleRest {
	
	@Autowired ScheduleService scheduleService;
	
	
	// scheduleCalendar → 캘린더 일정 조회하기
	@GetMapping("/scheduleList/{empNo}")	
    public List<Map<String , Object>> getScheduleList(@PathVariable String empNo) {
        List<Map<String , Object>> scheduleList = scheduleService.getScheduleList(empNo);

        return scheduleList;
    }
	
	// scheduleCalendar → 캘린더 일정 추가하기
	
	// scheduleCalendar → 캘린더 일정 삭제하기
	
	// scheduleCalendar → 캘린더 일정 수정하기

}
