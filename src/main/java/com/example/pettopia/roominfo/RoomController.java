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
import com.example.pettopia.vo.PetService;
import com.example.pettopia.vo.RoomImg;
import com.example.pettopia.vo.RoomInfo;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class RoomController {
		@Autowired
		private RoomService roomService;
		
		// 객실 추가
		@GetMapping("/room/getAddRoom")
		public String getAddRoom() {
			return "room/addRoom";
		}
		
		// 객실 등록 처리
	    
		
		
		// 객실 상세보기
//		@GetMapping("/room/getRoomOne")
//	    public String getRoomOne(Model model, Integer roomNo) {
//			Map<String, Object> roomOne = roomService.selectRoom(roomNo);
//	        log.debug(TeamColor.WJ+ "roomNo =======> " + roomNo.toString() + TeamColor.RESET);
//	        
//	        model.addAttribute("roomOne", roomOne);
//	        return "room/roomOne";
//	    }
		
		// 객실 상세보기
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
	        List<RoomImg> roomImages = roomService.roomImgService(); // 모든 RoomImg 가져오기
	        log.debug(TeamColor.WJ+ "roomList =======> " + roomList.toString() + TeamColor.RESET);
	        log.debug(TeamColor.WJ+ "roomImages =======> " + roomImages.toString() + TeamColor.RESET);
	        model.addAttribute("roomList", roomList);
	        model.addAttribute("roomImges", roomImages);
	        return "room/roomList";
	    }
	
}
