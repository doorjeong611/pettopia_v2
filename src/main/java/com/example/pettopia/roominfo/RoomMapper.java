package com.example.pettopia.roominfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.RoomInfo;

@Mapper
public interface RoomMapper {

	// 객실 리스트 전체 조회
	List<RoomInfo> selectRoom();

}
