package com.example.pettopia.roominfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RoomController {
	@GetMapping("/room/getRoomList")
	public String getRoomList() {
		return "room/roomList";
	}
	
}
