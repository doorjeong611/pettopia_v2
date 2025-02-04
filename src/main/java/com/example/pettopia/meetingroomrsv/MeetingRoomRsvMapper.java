package com.example.pettopia.meetingroomrsv;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.MeetingRoomRsv;

@Mapper
public interface MeetingRoomRsvMapper {
	
	// 회의실 삭제 : 회의실 번호 별 예약 수
	Integer selectMeetingRoomRsvCntByRoomNo(Integer roomNo);
	
	// 회의실 삭제 : 회의실 번호별 예약 삭제
	Integer deleteRsvByRoomNo(Integer roomNo);
	
	// 회의실 예약 가능 시간
	List<String> selectRsvTime(MeetingRoomRsv meetingRoomRsv);
	
	// 회의실 예약
	Integer insertMeetingRoomRsv(MeetingRoomRsv meetingRoomRsv);
	
	// 회의실 예약 리스트
	List<Map<String, Object>> selectMeetingRoomRsvList(Map<String, Object> paramMap);
	
	// 총 회의실 예약 수 조회
	Integer selectCountMeetingRoomRsvList();
}
