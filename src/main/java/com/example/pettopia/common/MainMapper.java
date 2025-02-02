package com.example.pettopia.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Schedule;

@Mapper
public interface MainMapper {
	
	// PetTopiaMain → 오늘 일정 조회(allDay)
	List<Schedule> selectTodayScheduleByAllDay(String empNo);

	// PetTopiaMain → 공지사항 목록 조회
	List<Map<String, Object>> selectNoticeListByMain();
	
	// PetTopiaMain → 결재 할 문서 조회
	List<Map<String, Object>> selectDocumentListByMain(String empNo);
	
	// PetTopiaMain → 월 별 객실 예약 현황
	List<Map<String, Object>> selectMonthlyReservationStatistics(Integer year);
	
	// PetTopiaMain → 연간 성별 가입 추이
	List<Map<String, Object>> selectGenderSignupStatistics(Integer year, String gender);
	
	// PetTopiaMain → 오늘의 객실 점유율
	Map<String, Object> selectReservationStats();
	
}
