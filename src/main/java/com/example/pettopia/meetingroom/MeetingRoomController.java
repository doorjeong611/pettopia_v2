package com.example.pettopia.meetingroom;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.MeetingRoomForm;

import jakarta.servlet.http.HttpSession;


@Controller
@Slf4j
public class MeetingRoomController {
	
	@Autowired MeetingRoomService meetingRoomService;
	
	// 회의실 목록
	@GetMapping("/meetingroom/getMeetingroomList")
	public String getMeetingroomList(Model model) {
		log.debug(TeamColor.KMJ+"[MeetingRoomController - POST addMeetingroom()]");
		
		List<Map<String, Object>> meetingRoomList = meetingRoomService.getMeetingRoomList();
		
		model.addAttribute("meetingRoomList", meetingRoomList);
		
		return "meetingroom/meetingroomList";
	}
	
	// 회의실 등록 폼
	@GetMapping("/meetingroom/addMeetingroom")
	public String addMeetingroom(Authentication auth) {
		
		return "meetingroom/addMeetingroom";
	}
	
	// 회의실 등록
	@PostMapping("/meetingroom/addMeetingroom")
	public String postMethodName(MeetingRoomForm meetingRoomForm , HttpSession session , RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.KMJ+"[MeetingRoomController - POST addMeetingroom()]");
		
		log.debug(TeamColor.KMJ+"meetingRoomForm : " + meetingRoomForm.toString());
		
		String path = session.getServletContext().getRealPath("/meetingRoomFile/");
		
		// 회의실 등록
		Integer roomNo = meetingRoomService.addMeetingRoom(meetingRoomForm, path);
		
		if(roomNo == null) { // 회의실 등록 실패시 
			String errorMessage = "회의실 등록 실패! 잠시후 다시 시도해주세요.";
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			return "redirect:/meetingroom/addMeetingroom";
		}
		
		// 성공시
		return "redirect:/meetingroom/getMeetingroomList";
	}
	
	// 회의실 상세보기
	@GetMapping("/meetingroom/getMeetingRoomOne")
	public String getMeetingRoomOne(@RequestParam String roomNo, Model model) {
		log.debug(TeamColor.KMJ+"[MeetingRoomController - GET getMeetingRoomOne()]");
		
		log.debug(TeamColor.KMJ+"roomNo : " + roomNo);
		
		Map<String, Object> meetingRoomInfo = meetingRoomService.getMeetingRoomOne(roomNo);
		
		model.addAttribute("roomInfo", meetingRoomInfo);
		
		return "meetingroom/meetingRoomOne";
	}
	
	

}
