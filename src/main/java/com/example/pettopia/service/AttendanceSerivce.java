package com.example.pettopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.mapper.AttendanceMapper;
import com.example.pettopia.vo.Attendance;

@Service
public class AttendanceSerivce {
	@Autowired AttendanceMapper attendanceMapper;
	
	// 오자윤 : /employee/attendanceOn 근태 : 출근
	public Integer attendanceOn(Attendance attendance) {
		return attendanceMapper.insertAttendanceOn(attendance);
	}
	// 오자윤 : /employee/attendanceOff 근태 : 퇴근
	public Integer attendanceOff(Attendance attendance) {
		return attendanceMapper.insertAttendanceOff(attendance);
	}
}
