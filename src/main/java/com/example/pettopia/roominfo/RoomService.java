package com.example.pettopia.roominfo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.RoomImg;
import com.example.pettopia.vo.RoomInfo;

@Service
public class RoomService {
	@Autowired
    private RoomMapper roomMapper;

	// 전체 객실 리스트 조회
    public List<RoomInfo> getRoomList() {
        return roomMapper.selectRoom();
    }
    
    // 전체 객실 이미지 조회
    public List<RoomImg> roomImgService() {
        return roomMapper.selectRoomImg();
    }
    
    // 상세보기
    public Map<String, Object> selectRoomOne(Integer roomNo) {
		return roomMapper.selectRoomOne(roomNo);
	}
    
    // 룸 타입 ENUM 값 추출
//    public List<String> getRoomTypes() {
//    	List<String> enumList = roomMapper.selectRoomTypeEnum(); // "enum('S','D','ST','F')"
//        return Arrays.asList(enumList.replace("'", "").split(","));
//    }
}
