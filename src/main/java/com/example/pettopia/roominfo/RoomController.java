package com.example.pettopia.roominfo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.RoomInfo;
import com.example.pettopia.vo.RoomRsv;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class RoomController {
		@Autowired
		private RoomService roomService;

		
		 // AJAX 요청을 받아 룸 타입별 객실 목록을 JSON으로 반환
	    @GetMapping("/listByType")
	    public List<Map<String, Object>> getRoomsByType(@RequestParam("roomType") String roomType) {
	        return roomService.getRoomsByType(roomType);
	    }
		
		// 객실 예약 리스트
		@GetMapping("/room/getRoomRsvList")
		public String selectRoomRsvList(Model model, 
										@RequestParam(defaultValue = "1") int currentPage, // 현재 페이지 번호
						                @RequestParam(defaultValue = "10") int pageSize, // 페이지 크기
						                @RequestParam(required = false) String searchWord) {
			// 전체 객실 리스트 가져오기
			List<Map<String, Object>> roomRsvList = roomService.selectRoomRsvList(searchWord, pageSize, currentPage); 
			 // 총 객실 수 및 페이지 계산
			int totalRecords = roomService.countRoomRsvList(searchWord); // 총 고객 수 조회
	        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
		    
		    log.debug(TeamColor.WJ + "roomRsvList ====> " + roomRsvList + TeamColor.RESET);
		    
		    model.addAttribute("roomRsvList", roomRsvList); 
		    model.addAttribute("currentPage", currentPage);
		    model.addAttribute("totalPages", totalPages);
		    model.addAttribute("pageSize", pageSize); // 페이지 크기
		    model.addAttribute("totalRecords", totalRecords);
		    model.addAttribute("searchWord", searchWord);
		    
		    log.debug(TeamColor.WJ + "searchWord ====> " + searchWord + TeamColor.RESET);
			return "room/roomRsvList";
		}
		
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
		
		@GetMapping("/room/getRoomInfo")
		@ResponseBody
		public Map<String, Object> getRoomInfo(@RequestParam("roomNo") Integer roomNo) {
		    // 특정 객실 정보 조회
		    Map<String, Object> roomInfo = roomService.selectRoomOne(roomNo);
		    
		    // 필요한 정보만 반환 (객실 이름, 타입, 수용 인원, 설명, 1박 당 가격)
		    Map<String, Object> response = new HashMap<>();
		    response.put("roomName", roomInfo.get("roomName"));
		    response.put("roomType", roomInfo.get("roomType"));
		    response.put("roomCapacity", roomInfo.get("roomCapacity"));
		    response.put("roomDesc", roomInfo.get("roomDesc"));
		    response.put("pricePerNight", roomInfo.get("pricePerNight"));
		    response.put("roomNo", roomInfo.get("roomNo"));
		    response.put("fileName", roomInfo.get("fileName"));


		    return response;  // JSON 형식으로 반환
		}
		
		// 객실 추가
		@GetMapping("/room/getAddRoom")
		public String getAddRoom() {
			return "room/addRoom";
		}
		
		// 객실 예약 추가
		@GetMapping("/room/getAddRoomRsv")
		public String getAddRoomRsv(Model model) {
			List<RoomInfo> roomList = roomService.getRoomList(); // 객실 목록 조회
		    model.addAttribute("roomList", roomList); // JSP로 전달
		    log.debug(TeamColor.WJ + "roomList 안에 뭐 들어있는지 ====> " + roomList + TeamColor.RESET); //아 사진이 안들어가있네
		    
			return "room/addRoomRsv";
		}
		
		// 객실 예약 추가
		@PostMapping("/room/addRoomRsv")
		public String addRoomRsv(
		        @RequestParam("roomNo") int roomNo,
		        @RequestParam("customerNo") int customerNo,
		        @RequestParam("checkInDatetime") String checkInDatetime,
		        @RequestParam("checkOutDatetime") String checkOutDatetime,
		        RedirectAttributes redirectAttributes) {
		    
		    log.debug(TeamColor.WJ + "checkIn : " + checkInDatetime + " checkOut : " + checkOutDatetime + TeamColor.RESET);
		    
		    log.debug("Received customerNo: " + customerNo);
		    
		    // 예약 객체 생성 및 값 설정
		    RoomRsv roomRsv = new RoomRsv();
		    roomRsv.setRoomNo(roomNo);
		    roomRsv.setCustomerNo(customerNo);
		    
		    // checkInDatetime과 checkOutDatetime을 그대로 String 값으로 설정
		    roomRsv.setCheckInDatetime(checkInDatetime);
		    roomRsv.setCheckOutDatetime(checkOutDatetime);

		    try {
		        // 서비스 메서드를 통해 예약 등록
		        roomService.addRoomRsv(roomRsv);

		        // 예약 등록 성공 메시지 전달
		        redirectAttributes.addFlashAttribute("successMessage", "객실 예약이 완료되었습니다.");
		    } catch (Exception e) {
		        log.error("객실 예약 등록 실패", e);
		        // 예약 등록 실패 시 에러 메시지 전달
		        redirectAttributes.addFlashAttribute("errorMessage", "예약 실패: " + e.getMessage());
		    }

		    // 예약 리스트 페이지로 리다이렉트
		    return "redirect:/room/getRoomRsvList";
		}

		

		// 객실 등록 처리
	    @PostMapping("/room/addRoom")
	    public String addRoom(@ModelAttribute RoomInfo roomInfo,
	                          @RequestParam("roomImg") MultipartFile roomImg,
	                          HttpSession session,
	                          RedirectAttributes redirectAttributes) {
	        log.debug(TeamColor.WJ + "addRoom 호출됨 " + TeamColor.RESET);
	        // 중복 체크
	        boolean isDuplicate = roomService.checkRoomName(roomInfo.getRoomName());
	        if (isDuplicate) {
	            redirectAttributes.addFlashAttribute("errorMessage", "이미 존재하는 객실 이름입니다.");
	            redirectAttributes.addFlashAttribute("alertType", "error");
	            return "redirect:/room/getAddRoom";
	        }
	        
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
		public String getRoomList(Model model,
		                          @RequestParam(defaultValue = "1") int currentPage, // 현재 페이지 번호
		                          @RequestParam(defaultValue = "6") int pageSize, // 페이지 크기
		                          @RequestParam(value = "roomType", required = false) String roomType) {
		    // 특정 룸 타입 필터링
		    List<Map<String, Object>> roomListImg;
		    if (roomType != null && !roomType.isEmpty()) {
		        roomListImg = roomService.getRoomsByType(roomType);
		    } else {
		        roomListImg = roomService.getRoomListWithImages();
		    }

		    log.debug(TeamColor.WJ + "roomListImg =======> " + roomListImg + TeamColor.RESET);

		    // 총 객실 수 및 페이지 계산
		    int totalRecords = roomListImg.size();
		    int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

		    // 페이지네이션 적용
		    int startIdx = (currentPage - 1) * pageSize;
		    int endIdx = Math.min(startIdx + pageSize, totalRecords);
		    List<Map<String, Object>> paginatedList = roomListImg.subList(startIdx, endIdx);

		    // 모델에 추가
		    model.addAttribute("roomListImg", paginatedList);  // 현재 페이지의 데이터만 전달
		    model.addAttribute("currentPage", currentPage);
		    model.addAttribute("totalPages", totalPages);
		    model.addAttribute("totalRecords", totalRecords);
		    model.addAttribute("roomType", roomType);

		    return "room/roomList";
		}

		
		//객실 삭제
		@GetMapping("/room/deleteRoom")
		public String deleteRoom(@RequestParam int roomNo, Model model) {
			boolean isRemove = roomService.deleteRoom(roomNo);
			if(isRemove) {
				log.debug(TeamColor.WJ + "isRemove =======> " + "삭제" + TeamColor.RESET);
				return "redirect:/room/getRoomList";
			}
			return "redirect:/room/getRoomList";
		}
}
