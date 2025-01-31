package com.example.pettopia.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Schedule;

@Mapper
public interface MainMapper {
	
	// PetTopiaMaine → 오늘 일정 조회(allDay)
	List<Schedule> selectTodayScheduleByAllDay(String empNo);

}
