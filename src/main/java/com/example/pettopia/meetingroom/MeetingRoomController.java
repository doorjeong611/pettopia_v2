package com.example.pettopia.meetingroom;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.meetingroomimg.MeetingRoomImgMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.MeetingRoom;
import com.example.pettopia.vo.MeetingRoomForm;
import com.example.pettopia.vo.MeetingRoomImg;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;



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
	
	
	// 회의실 수정하기
	@PostMapping("/meetingroom/modifyMeetingRoom")
	public String modifyMeetingRoom(HttpSession session, MeetingRoomForm meetingRoomForm, String roomNo, String roomImgNo, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.KMJ+"[MeetingRoomController - POST modifyMeetingRoom()]");
		
		log.debug(TeamColor.KMJ+"roomNo : " + roomNo);
		log.debug(TeamColor.KMJ+"roomImgNo : " + roomImgNo);
		log.debug(TeamColor.KMJ+"meetingRoomForm : " + meetingRoomForm.toString());
		
		// 회의실 정보 수정
		MeetingRoom roomInfo = new MeetingRoom();
		roomInfo.setRoomNo(Integer.parseInt(roomNo));
		roomInfo.setRoomName(meetingRoomForm.getRoomName());
		roomInfo.setRoomLocation(meetingRoomForm.getRoomLocation());
		roomInfo.setRoomCapacity(meetingRoomForm.getRoomCapacity());
		roomInfo.setRoomInfo(meetingRoomForm.getRoomInfo());
		
		boolean roomInfoResult = meetingRoomService.modifyMeetingRoomInfo(roomInfo);
		boolean roomImgResult = false;
		// 정보 수정에 성공하고 수정할 회의실 이미지가 있다면 
		if(roomInfoResult == true && meetingRoomForm.getRoomImg().getSize() > 0) {
			
			String path = session.getServletContext().getRealPath("/meetingRoomFile/");

			MultipartFile roomImg = meetingRoomForm.getRoomImg();
			
			roomImgResult = meetingRoomService.modifyMeetingRoomImg(path, roomImg, roomImgNo, roomNo);
			
			log.debug(TeamColor.KMJ+"roomImgResult : " + roomImgResult);
		}
		
		if(roomInfoResult != true || roomImgResult != true) {
			String errorMessage = "회의실 수정 실패! 잠시후 다시 시도해주세요.";
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			return "redirect:/meetingroom/getMeetingRoomOne";
		}
		
		
		
		return "redirect:/meetingroom/getMeetingRoomOne?roomNo="+roomNo;
	}
	
	// 회의실 삭제
	@GetMapping("/meetingroom/deleteMeetingRoom")
	public String deleteMeetingRoom(HttpSession session, @RequestParam String roomNo, RedirectAttributes redirectAttributes) {
		
		log.debug(TeamColor.KMJ+"[MeetingRoomController - GET deleteMeetingRoom()]");
		
		log.debug(TeamColor.KMJ+"roomNo : " + roomNo);
		
		String path = session.getServletContext().getRealPath("/meetingRoomFile/");
		
		boolean result = meetingRoomService.removeMeetingRoom(roomNo, path);
		
		log.debug(TeamColor.KMJ+"result : " + result);
		
		if(result == false) { // 삭제 실패시 
			
			String errorMessage = "회의실 삭제 실패! 잠시후 다시 시도해주세요.";
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			
			return "redirect:/meetingroom/getMeetingroomList";
		}
		
		return "redirect:/meetingroom/getMeetingroomList";
	}
	
	
	

}
