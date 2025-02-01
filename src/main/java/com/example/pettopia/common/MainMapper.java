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
}
