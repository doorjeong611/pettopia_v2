package com.example.pettopia.attendance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Attendance;

@Mapper
public interface AttendanceMapper {

	// 오자윤 : /employee/attendance 페이지네이션 카운트
	int countAttendance(Map<String, Object> params);
	
	// 오자윤 : /employee/attendance 근태리스트 
	List<Map<String, Object>> selectAttendanceList(Map<String, Object> params);
	
	// 오자윤 : /employee/attendance 근태리스트 
	Map<String, Object> countEmployeeStatus(Attendance attendance);
	
	// 오자윤 : /employee/attendanceOn & Off 근태기록 조회
	List<Attendance> getAttendanceList(Attendance attendance);
	
	// 오자윤 : /employee/attendanceOn 근태 : 출근
	Integer insertAttendanceOn(Attendance attendance);
	
	// 오자윤 : /employee/attendanceOn 근태 : 퇴근
	Integer insertAttendanceOff(Attendance attendance);
}
