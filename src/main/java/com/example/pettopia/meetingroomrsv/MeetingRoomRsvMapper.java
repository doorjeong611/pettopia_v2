package com.example.pettopia.meetingroomrsv;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MeetingRoomRsvMapper {
	
	// 회의실 삭제 : 회의실 번호 별 예약 수
	Integer selectMeetingRoomRsvCntByRoomNo(Integer roomNo);
	
	// 회의실 삭제 : 회의실 번호별 예약 삭제
	Integer deleteRsvByRoomNo(Integer roomNo);
	
	
	
}
