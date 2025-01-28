package com.example.pettopia.schedule;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Schedule;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ScheduleRest {
	
	@Autowired ScheduleService scheduleService;
	
	
	// scheduleCalendar → 캘린더 일정 조회하기
	@GetMapping("/scheduleList/{empNo}")	
    public List<Map<String , Object>> getScheduleList(@PathVariable String empNo, @RequestParam(required = false) String scheduleType) throws Exception {
		
        List<Map<String , Object>> scheduleList = scheduleService.getScheduleList(empNo, scheduleType);
        
        return scheduleList;
    }
	
	// scheduleCalendar → 캘린더 일정 추가하기
	@PostMapping("/addSchedule")
    public Schedule addSchedule(@RequestBody Map<String, Object> map, Authentication authentication) throws Exception {
		
		EmpUserDetails empUserDetails = (EmpUserDetails)authentication.getPrincipal();
		
		Schedule schedule = new Schedule();
		
		schedule.setScheduleTitle((String) map.get("scheduleTitle"));
		schedule.setScheduleType((String) map.get("scheduleType"));
		schedule.setEmpNo(empUserDetails.getUsername());

        // UTC 시간을 LocalDateTime으로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
        ZonedDateTime startUTC = ZonedDateTime.parse((String) map.get("startDatetime"), formatter).withZoneSameInstant(ZoneId.of("Asia/Seoul"));
        ZonedDateTime endUTC = map.get("endDatetime") != null ? ZonedDateTime.parse((String) map.get("endDatetime"), formatter).withZoneSameInstant(ZoneId.of("Asia/Seoul")) : null;

        // 한국 시간으로 변환하여 저장
        schedule.setStartDatetime(startUTC.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        schedule.setEndDatetime(endUTC != null ? endUTC.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) : null);
        schedule.setAllDay((Boolean) map.get("allDay") ? "Y" : "N");

        // 저장한 일정의 key 값을 포함한 데이터를 다시 반환
        scheduleService.addSchedule(schedule);
        log.debug(TeamColor.KDH + schedule.toString() + TeamColor.RESET);
        
        return schedule;
    }
	
	// scheduleCalendar → 캘린더 일정 삭제하기
	@DeleteMapping("/removeSchedule")
    public String calendarDelete(@RequestParam Integer scheduleNo) throws Exception{
        try{
        	scheduleService.removeSchedule(scheduleNo);
            return "success";
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
    }
	
	// scheduleCalendar → 캘린더 일정 수정하기
	@PutMapping("/modifySchedule/{scheduleNo}")
    public String eventUpdate(@PathVariable Integer scheduleNo, @RequestBody Map<String, Object> paramMap){

        Schedule schedule = new Schedule();
        schedule.setScheduleTitle((String)paramMap.get("title"));
        schedule.setScheduleNo(scheduleNo);
        schedule.setStartDatetime(paramMap.get("start").toString().replace("T", " ").substring(0, 19));
        if (paramMap.get("end") != null) {
            schedule.setEndDatetime(paramMap.get("end").toString().replace("T", " ").substring(0, 19));
        }
        
        // 클라이언트에서 전달된 allDay 값을 그대로 사용
        schedule.setAllDay((String) paramMap.get("allDay"));
        
        try {
        	scheduleService.modifySchedule(schedule);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

}
