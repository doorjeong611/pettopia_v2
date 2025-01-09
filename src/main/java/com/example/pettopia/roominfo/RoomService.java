package com.example.pettopia.roominfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.RoomInfo;

@Service
public class RoomService {
	@Autowired
    private RoomMapper roomMapper;

	// 전체 객실 리스트 조회
    public List<RoomInfo> getRoomList() {
        return roomMapper.selectRoom();
    }
}
