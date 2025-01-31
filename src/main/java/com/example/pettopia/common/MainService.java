package com.example.pettopia.common;

import java.util.List;

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

}
