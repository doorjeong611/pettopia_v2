package com.example.pettopia.meetingroomimg;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.MeetingRoomImg;

@Mapper
public interface MeetingRoomImgMapper {
	
	
	// 회의실 등록
	Integer insertMeetingRoomImg(MeetingRoomImg meetingRoomImg);
	
	
	

}
