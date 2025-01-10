package com.example.pettopia.roominfo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.RoomInfo;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class RoomController {
		@Autowired
		private RoomService roomService;
		
		// 객실 상세보기
//		@GetMapping("/room/getRoomOne")
//	    public String getRoomOne(Model model, Integer roomNo) {
//			Map<String, Object> roomOne = roomService.selectRoom(roomNo);
//	        log.debug(TeamColor.WJ+ "roomNo =======> " + roomNo.toString() + TeamColor.RESET);
//	        
//	        model.addAttribute("roomOne", roomOne);
//	        return "room/roomOne";
//	    }
		
		@GetMapping("/room/getRoomOne")
		public String getRoomOne(Model model, @RequestParam("roomNo") Integer roomNo) {
			 // roomNo 확인
		    log.debug(TeamColor.WJ + "roomNo =======> " + roomNo + TeamColor.RESET);

		    // roomOne 데이터 조회
		    Map<String, Object> roomOne = roomService.selectRoomOne(roomNo);

		    // roomOne 데이터 확인
		    log.debug("roomOne =======> " + roomOne);

		    // 모델에 데이터 추가
		    model.addAttribute("roomOne", roomOne);
		    return "room/roomOne"; // 상세보기 JSP로 이동
		}

		
		// 객실 전체 조회 (목록)
	 	@GetMapping("/room/getRoomList")
	    public String getRoomList(Model model) {
	        List<RoomInfo> roomList = roomService.getRoomList();
	        log.debug(TeamColor.WJ+ "roomList =======> " + roomList.toString() + TeamColor.RESET);
	        model.addAttribute("roomList", roomList);
	        return "room/roomList";
	    }
	
}
