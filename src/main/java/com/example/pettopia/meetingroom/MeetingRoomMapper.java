package com.example.pettopia.meetingroom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.MeetingRoom;

@Mapper
public interface MeetingRoomMapper {
	
	// 회의실 등록
	Integer insertMeetingRoom(MeetingRoom meetingRoom);
	 
	// 회의실 목록
	List<Map<String, Object>> selectMeetingRoomList();
	
	// 회의실 상세보기
	Map<String, Object> selectMeetingRoomOne(String roomNo);
	
}
