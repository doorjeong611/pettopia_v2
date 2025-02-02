package com.example.pettopia.meetingroomimg;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.MeetingRoomImg;

@Mapper
public interface MeetingRoomImgMapper {
	
	
	// 회의실 이미지 등록
	Integer insertMeetingRoomImg(MeetingRoomImg meetingRoomImg);
	
	// 회의실 이미지 조회
	String selectMeetingRoomImgOne(Integer roomImgNo);
	
	// 회의실 이미지 수정
	Integer updateMeetingRoomImg(MeetingRoomImg meetingRoomImg);
	
	// 회의실 이미지 삭제
	Integer deleteMeetingRoomImg(Integer roomNo);

}
