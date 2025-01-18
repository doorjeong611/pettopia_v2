package com.example.pettopia.roominfo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.RoomInfo;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class RoomController {
		@Autowired
		private RoomService roomService;
		
		// 객실 수정
		@PostMapping("/room/updateRoom")
		public String updateRoom(@ModelAttribute RoomInfo roomInfo,
		                         @RequestParam(value = "roomImg", required = false) MultipartFile roomImg,
		                         HttpSession session,
		                         RedirectAttributes redirectAttributes) {
			log.debug(TeamColor.WJ + "updateRoom 호출됨 - roomInfo ====> " + roomInfo + TeamColor.RESET);

		    try {
		        String uploadPath = session.getServletContext().getRealPath("/upload/");
		        roomService.updateRoomWithImage(roomInfo, roomImg, uploadPath);
		        redirectAttributes.addFlashAttribute("successMessage", "객실 정보가 성공적으로 수정되었습니다!");
		    } catch (Exception e) {
		    	log.debug(TeamColor.WJ + "객실 수정 중 오류 발생 ====> " + e + TeamColor.RESET);
		        redirectAttributes.addFlashAttribute("errorMessage", "객실 정보 수정 중 오류가 발생했습니다.");
		    }

		    return "redirect:/room/getRoomList";
		}

		
		
		// 객실 추가
		@GetMapping("/room/getAddRoom")
		public String getAddRoom() {
			return "room/addRoom";
		}

		// 객실 등록 처리
	    @PostMapping("/room/addRoom")
	    public String addRoom(@ModelAttribute RoomInfo roomInfo,
	                          @RequestParam("roomImg") MultipartFile roomImg,
	                          HttpSession session,
	                          RedirectAttributes redirectAttributes) {
	        log.debug(TeamColor.WJ + "addRoom 호출됨 " + TeamColor.RESET);
	        log.debug(TeamColor.WJ + "roomType 길이 =======>" + roomInfo.getRoomType().length() + TeamColor.RESET); 
	        try {
	            String uploadPath = session.getServletContext().getRealPath("/upload/"); // 파일 저장 경로
	            roomService.addRoomWithImage(roomInfo, roomImg, uploadPath); // 서비스 호출

	            redirectAttributes.addFlashAttribute("successMessage", "객실이 성공적으로 등록되었습니다!");
	            redirectAttributes.addFlashAttribute("alertType", "success");
	            log.debug(TeamColor.WJ + "메시지 ====>  " + redirectAttributes.getFlashAttributes().get("successMessage") + TeamColor.RESET);

	        } catch (Exception e) {
	            redirectAttributes.addFlashAttribute("errorMessage", "객실 등록 중 오류가 발생했습니다.");
	            redirectAttributes.addFlashAttribute("alertType", "error");
	        }
	        return "redirect:/room/getRoomList";
	    }
		
		// 객실 등록 처리 (text만 저장 가능)
//	    @PostMapping("/room/addRoom")
//	    public String addRoom(@ModelAttribute RoomInfo roomInfo, RedirectAttributes redirectAttributes) {
//	        try {
//	        	roomService.addRoomInfo(roomInfo);
//	        	log.debug(TeamColor.WJ + "roomInfo =======> " + roomInfo + TeamColor.RESET);
//	            redirectAttributes.addFlashAttribute("successMessage", "객실이 성공적으로 등록되었습니다!");
//	        } catch (Exception e) {
//	            redirectAttributes.addFlashAttribute("errorMessage", "객실 등록 중 오류가 발생했습니다.");
//	        }
//	        return "redirect:/room/getRoomList";
//	    }
		
		// 객실 상세보기
		@GetMapping("/room/getRoomOne")
		public String getRoomOne(Model model, @RequestParam("roomNo") Integer roomNo) {
			 // roomNo 확인
		    log.debug(TeamColor.WJ + "roomNo =======> " + roomNo + TeamColor.RESET);

		    // roomOne 데이터 조회
		    Map<String, Object> roomOne = roomService.selectRoomOne(roomNo);

		    // roomOne 데이터 확인
		    log.debug(TeamColor.WJ + "roomOne =======> " + roomOne + TeamColor.RESET);

		    // 모델에 데이터 추가
		    model.addAttribute("roomOne", roomOne);
		    return "room/roomOne"; // 상세보기 JSP로 이동
		}

		
		// 객실 리스트에 이미지 뿌려주기
		@GetMapping("/room/getRoomList")
		public String getRoomList(Model model) {
		    List<Map<String, Object>> roomListImg = roomService.getRoomListWithImages(); 
		    model.addAttribute("roomListImg", roomListImg); 
		    return "room/roomList"; 
		}
		
		// 객실 삭제 메서드
	    @PostMapping("/room/deleteRoom")
	    public String deleteRoom(@RequestParam("roomNo") int roomNo, Model model) {
	        boolean isDeleted = roomService.deleteRoom(roomNo);

	        if (isDeleted) {
	            model.addAttribute("message", "객실이 성공적으로 삭제되었습니다.");
	            log.debug(TeamColor.WJ + "message =======> " + model + TeamColor.RESET);

	        } else {
	            model.addAttribute("message", "객실 삭제에 실패했습니다.");
	        }

	        return "redirect:/room/getRoomList"; // 삭제 후 목록 페이지로 리다이렉트
	    }
	
}
