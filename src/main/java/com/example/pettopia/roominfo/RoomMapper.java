package com.example.pettopia.roominfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.RoomImg;
import com.example.pettopia.vo.RoomInfo;

@Mapper
public interface RoomMapper {

	// 객실 리스트 전체 조회
	List<RoomInfo> selectRoom();
	
	// 객실 이미지 리스트 전체 조회
	List<RoomImg> selectRoomImg();
	
	// 상세보기
	Map<String, Object> selectRoomOne(Integer roomNo);
	
	// 객실 등록
	 int insertRoomInfo(RoomInfo roomInfo);
	 
	// 객실 이미지 등록
	 int insertRoomImg(RoomImg roomImg);
	 
	// 전체 객실 및 이미지 조회 (추가된 메서드)
	List<Map<String, Object>> selectRoomWithImages();
	
	 // 객실 정보 수정
    int updateRoomInfo(RoomInfo roomInfo);

    // 객실 이미지 수정
    int updateRoomImg(RoomImg roomImg);

}
