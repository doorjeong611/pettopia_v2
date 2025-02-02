package com.example.pettopia.meetingroom;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MeetingRoomRest {
	
	@Autowired MeetingRoomService meetingRoomService;
	
	// 회의실 상세보기
	@GetMapping("/rest/getMeetingRoomOne")
	public Map<String, Object> getMeetingRoomOne(@RequestParam String roomNo) {
		log.debug(TeamColor.KMJ+"[MeetingRoomController - GET getMeetingRoomOne()]");
		
		log.debug(TeamColor.KMJ+"roomNo : " + roomNo);
		
		Map<String, Object> meetingRoomInfo = meetingRoomService.getMeetingRoomOne(roomNo);
		
		
		
		return meetingRoomInfo;
	}
	
	// 회의실 예약 폼 : 예약 가능 시간대 선정
	@GetMapping("/rest/getReserveTime")
	public List<Map<String, Object>> getReserveTime(@RequestParam String roomNo, @RequestParam String rsvDate ) {
		log.debug(TeamColor.KMJ+"[MeetingRoomController - GET getReserveTime()]");

		log.debug(TeamColor.KMJ+"roomNo : " + roomNo);
		log.debug(TeamColor.KMJ+"rsvDate : " + rsvDate);
		
		List<Map<String, Object>> rsvTime = meetingRoomService.getReserveTime(roomNo, rsvDate);
		
		
		
		return rsvTime;
	}
	
	
	
	

}
