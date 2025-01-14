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

		@PostMapping("/room/addRoom")
		public String addRoom(@ModelAttribute RoomInfo roomInfo,
		                      @RequestParam("roomImg") MultipartFile roomImg,
		                      RedirectAttributes redirectAttributes) {
			log.debug(TeamColor.WJ + "addRoom 호출됨 " + TeamColor.RESET);
		    try {
		        // 객실 정보 등록
		        int insertRoomRow = roomService.addRoomInfo(roomInfo); // 방 등록 후 방 번호 반환
		        log.debug(TeamColor.WJ + "insertRoomRow =======> " + insertRoomRow + TeamColor.RESET);
		        log.debug(TeamColor.WJ + "roomNo =======> " + roomInfo.getRoomNo() + TeamColor.RESET);
		        
		        // 이미지 처리
		        if (!roomImg.isEmpty()) {
		            RoomImg roomImage = new RoomImg();
		            roomImage.setRoomNo(roomInfo.getRoomNo()); // 등록된 방 번호 설정
		            log.debug(TeamColor.WJ + "roomImgNo =======> " + roomImage.getRoomNo() + TeamColor.RESET);
		            roomImage.setOriginFileName(roomImg.getOriginalFilename());
		            roomImage.setFileName(roomImg.getOriginalFilename()); // 저장할 파일명 설정
		            roomImage.setFileExt(getFileExtension(roomImg.getOriginalFilename()));
		            roomImage.setFileType(roomImg.getContentType());

		            // 이미지 등록
		            roomService.addRoomImg(roomImage);
		        }

		        redirectAttributes.addFlashAttribute("successMessage", "객실이 성공적으로 등록되었습니다!");
		    } catch (Exception e) {
		        redirectAttributes.addFlashAttribute("errorMessage", "객실 등록 중 오류가 발생했습니다.");
		        log.error("Error occurred during room registration: ", e);
		    }
		    return "redirect:/room/getRoomList";
		}


		// 파일 확장자를 가져오는 메서드
		private String getFileExtension(String fileName) {
		    return fileName.substring(fileName.lastIndexOf('.') + 1);
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
