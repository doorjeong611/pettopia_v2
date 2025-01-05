package com.example.pettopia.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Attendance;

@Mapper
public interface AttendanceMapper {
	// 오자윤 : /employee/attendanceOn & Off 근태기록 조회
	Integer getAttendanceExists(Attendance attendance);
	
	// 오자윤 : /employee/attendanceOn 근태 : 출근
	Integer insertAttendanceOn(Attendance attendance);
	
	// 오자윤 : /employee/attendanceOn 근태 : 출근
	Integer insertAttendanceOff(Attendance attendance);
}
