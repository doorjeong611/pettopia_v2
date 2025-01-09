package com.example.pettopia.roominfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.RoomInfo;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class RoomController {
		@Autowired
		private RoomService roomService;

	 	@GetMapping("/room/getRoomList")
	    public String getRoomList(Model model) {
	        List<RoomInfo> roomList = roomService.getRoomList();
	        log.debug(TeamColor.WJ+ "roomList =======> " + roomList.toString() + TeamColor.RESET);
	        model.addAttribute("roomList", roomList);
	        return "room/roomList";
	    }
	
}
