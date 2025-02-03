package com.example.pettopia.roominfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.RoomImg;
import com.example.pettopia.vo.RoomInfo;
import com.example.pettopia.vo.RoomRsv;

@Mapper
public interface RoomMapper {
	// 룸타입으로 객실 필터링
	List<Map<String, Object>> selectRoomsByType(String roomType);
	
	 // roomName 중복 검사
    int countByRoomName(String roomName);

	// 객실 예약 전체 조회
	List<Map<String, Object>> selectRoomRsvList(Map<String, Object> params);
	
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
	 
	// 전체 객실 및 이미지 조회
	List<Map<String, Object>> selectRoomWithImages();
	
	 // 객실 정보 수정
    int updateRoomInfo(RoomInfo roomInfo);

    // 객실 이미지 수정
    int updateRoomImg(RoomImg roomImg);
    
    // 객실 삭제
    int deleteRoomImages(int roomNo);
    List<RoomImg> selectRoomImages(int roomNo);
    int deleteRoom(int roomNo);
    
    // 객실 페이징
    int countRoomList(Map<String, Object> params);

    // 예약 객실 삭제
	void deleteRsvByRoomNo(int roomNo);

	// 객실 예약 추가
	int insertRoomRsv(RoomRsv roomRsv);
	
	// 객실 예약 리스트 갯수 카운트
	int countRoomRsvList(Map<String, Object> params);
	

}
