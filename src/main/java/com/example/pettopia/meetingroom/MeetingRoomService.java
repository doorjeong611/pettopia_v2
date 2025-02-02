package com.example.pettopia.meetingroom;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.meetingroomimg.MeetingRoomImgMapper;
import com.example.pettopia.meetingroomrsv.MeetingRoomRsvMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.MeetingRoom;
import com.example.pettopia.vo.MeetingRoomForm;
import com.example.pettopia.vo.MeetingRoomImg;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class MeetingRoomService {
	
	@Autowired MeetingRoomMapper meetingRoomMapper;
	@Autowired MeetingRoomImgMapper meetingRoomImgMapper;
	@Autowired MeetingRoomRsvMapper meetingRoomRsvMapper;
	
	
	
	// 회의실 등록
	public Integer addMeetingRoom(MeetingRoomForm meetingRoomForm, String path) {
		
		log.debug(TeamColor.KMJ+"[MeetingRoomService - addMeetingroom()]");
		
		log.debug(TeamColor.KMJ+"meetingRoomForm : " + meetingRoomForm.toString());
		
		
		// 회의실 정보 등록 -> roomNo 반환
		MeetingRoom meetingRoom = new MeetingRoom();
		
		meetingRoom.setRoomName(meetingRoomForm.getRoomName());
		meetingRoom.setRoomInfo(meetingRoomForm.getRoomInfo());
		meetingRoom.setRoomCapacity(meetingRoomForm.getRoomCapacity());
		meetingRoom.setRoomLocation(meetingRoomForm.getRoomLocation());
		
		meetingRoomMapper.insertMeetingRoom(meetingRoom);
		
		Integer roomNo = meetingRoom.getRoomNo();
		
		if(roomNo != null) {// 회의실 정보 등록 성공
			
			// 회의실 이미지 등록
			MultipartFile roomImg = meetingRoomForm.getRoomImg();
			
			int dotIndex = roomImg.getOriginalFilename().lastIndexOf(".");					// 확장자와 파일명 구분을 위한 . 인덱스 찾기
			String orginFileName = roomImg.getOriginalFilename().substring(0, dotIndex);	// 원본파일명
			String fileName = UUID.randomUUID().toString().replace("-", "");				// 랜덤으로 생성한 파일명
			String ext = roomImg.getOriginalFilename().substring(dotIndex);					// 확장자 (.jpg)
			String fileType = roomImg.getContentType();										// 파일 타입

			log.debug(TeamColor.KMJ + "dotIndex :" + dotIndex);
			log.debug(TeamColor.KMJ + "orginFileName :" + orginFileName);
			log.debug(TeamColor.KMJ + "fileName :" + fileName);
			log.debug(TeamColor.KMJ + "ext :" + ext);
			log.debug(TeamColor.KMJ + "fileType :" + fileType);
			
			
			// 파일 유효성 검사 (이미지 파일만 가능)
			// Spring Boot에서 Multipart 파일의 최대 업로드 크기는 기본적으로 1MB로 설정함. -> 수정하려면 application.yml 에서 설정해야함
			List<String> allowedExtensions = Arrays.asList(".jpg", ".png", ".jpeg");
			if (!allowedExtensions.contains(ext.toLowerCase())) {
			    throw new IllegalArgumentException("이미지 파일만 가능");
			}

			
			MeetingRoomImg meetingRoomImg = new MeetingRoomImg();
			
			meetingRoomImg.setRoomNo(roomNo);
			meetingRoomImg.setFileName(fileName);
			meetingRoomImg.setOriginFileName(orginFileName);
			meetingRoomImg.setFileType(fileType);
			meetingRoomImg.setFileExt(ext);

			
			// db insert
			Integer fileResultRow = meetingRoomImgMapper.insertMeetingRoomImg(meetingRoomImg);
			log.debug(TeamColor.KMJ + "fileResultRow :" + fileResultRow);
			
			if(fileResultRow == 1) {
				// 물리적 파일 저장하기
				try {
					roomImg.transferTo(new File(path + fileName + ext)); // /meetingRoomFile/manggom.jpg
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}

		}

		return roomNo;
	}
	
	
	// 회의실 목록
	public List<Map<String, Object>> getMeetingRoomList(){
		log.debug(TeamColor.KMJ+"[MeetingRoomService - getMeetingRoomList()]");
		
		List<Map<String, Object>> meetingRoomList = meetingRoomMapper.selectMeetingRoomList();
		
		log.debug(TeamColor.KMJ+"meetingRoomList : " + meetingRoomList.toString());
		
		return meetingRoomList;
		
	}
	
	// 회의실 상세보기
	public Map<String, Object> getMeetingRoomOne(String roomNo){
		log.debug(TeamColor.KMJ+"[MeetingRoomService - getMeetingRoomOne()]");
		
		Map<String, Object> roomInfo = meetingRoomMapper.selectMeetingRoomOne(roomNo);
		
		log.debug(TeamColor.KMJ+"roomInfo : " + roomInfo.toString());
		
		return roomInfo;
	}
	
	// 회의실 정보 수정
	public boolean modifyMeetingRoomInfo(MeetingRoom meetingRoom) {
		log.debug(TeamColor.KMJ+"[MeetingRoomService - modifyMeetingRoomInfo()]");
		
		boolean result = false; // 정보 수정 성공시 true

		Integer row = meetingRoomMapper.updateMeetingRoomInfo(meetingRoom);
		
		log.debug(TeamColor.KMJ+"row : " + row);
		
		if(row != 0 ) {
			result = true;
		}
		
		log.debug(TeamColor.KMJ+"result : " + result);
		return result;
	}
	
	// 회의실 이미지 수정
	public boolean modifyMeetingRoomImg(String path, MultipartFile roomImg, String roomImgNo, String roomNo) {
		log.debug(TeamColor.KMJ+"[MeetingRoomService - modifyMeetingRoomImg()]");
		
		boolean result = false; // 정보 수정 성공시 true

		// MultipartFile roomImg
		int dotIndex = roomImg.getOriginalFilename().lastIndexOf(".");					// 확장자와 파일명 구분을 위한 . 인덱스 찾기
		String orginFileName = roomImg.getOriginalFilename().substring(0, dotIndex);	// 원본파일명
		String fileName = UUID.randomUUID().toString().replace("-", "");				// 랜덤으로 생성한 파일명
		String ext = roomImg.getOriginalFilename().substring(dotIndex);					// 확장자 (.jpg)
		String fileType = roomImg.getContentType();										// 파일 타입

		log.debug(TeamColor.KMJ + "dotIndex :" + dotIndex);
		log.debug(TeamColor.KMJ + "orginFileName :" + orginFileName);
		log.debug(TeamColor.KMJ + "fileName :" + fileName);
		log.debug(TeamColor.KMJ + "ext :" + ext);
		log.debug(TeamColor.KMJ + "fileType :" + fileType);
		
		
		// 파일 유효성 검사 (이미지 파일만 가능)
		// Spring Boot에서 Multipart 파일의 최대 업로드 크기는 기본적으로 1MB로 설정함. -> 수정하려면 application.yml 에서 설정해야함
		List<String> allowedExtensions = Arrays.asList(".jpg", ".png", ".jpeg");
		if (!allowedExtensions.contains(ext.toLowerCase())) {
		    throw new IllegalArgumentException("이미지 파일만 가능");
		}
		
		MeetingRoomImg meetingRoomImg = new MeetingRoomImg();
		
		meetingRoomImg.setRoomImgNo(Integer.parseInt(roomImgNo));
		meetingRoomImg.setRoomNo(Integer.parseInt(roomNo));
		meetingRoomImg.setFileName(fileName);
		meetingRoomImg.setOriginFileName(orginFileName);
		meetingRoomImg.setFileType(fileType);
		meetingRoomImg.setFileExt(ext);

		
		// db 수정 전 물리적으로 삭제할 파일 이름 가져오기
		Integer roomImgNum = Integer.parseInt(roomImgNo);
		
		String deleteFileName =  meetingRoomImgMapper.selectMeetingRoomImgOne(roomImgNum);
		log.debug(TeamColor.KMJ+"deleteFileName : " + deleteFileName);
		
		
		// db 수정
		Integer row = meetingRoomImgMapper.updateMeetingRoomImg(meetingRoomImg);
		log.debug(TeamColor.KMJ+"row : " + row);
		
		if(row == 1) {
			
			// 새로운 물리적 파일 저장하기
			try {
				roomImg.transferTo(new File(path + fileName + ext)); // /meetingRoomFile/manggom5(UUID로 변환).jpg
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException();
			}
			
			
			File f = new File(path, deleteFileName); 	// 해당 path에 deleteFileName의 파일 가져옴
			if(f.exists()) {						 	// 파일이 존재한다면
				boolean deleteFileResult = f.delete();	// 파일 삭제
				
				if(deleteFileResult == false) {			// 파일 삭제에 실패한다면  예외 발생시키기
					throw new RuntimeException("파일 삭제에 실패했습니다: " + deleteFileName); // 물리적 파일 삭제는 @transactional이 관리하지 않으므로 실패시 RuntimeException을 만들어줌	
				
				}

			}

		}
		
		result = true;
		
		log.debug(TeamColor.KMJ+"result : " + result);
		return result;
	}
	
	
	// 회의실 삭제
	public boolean removeMeetingRoom(String roomNo, String path) {
		log.debug(TeamColor.KMJ+"[MeetingRoomService - removeMeetingRoom()]");
		boolean result = false;
		
		// 물리적 파일 삭제를 위해 이미지 이름 조회
		Integer roomNum = Integer.parseInt(roomNo);
		
		String deleteFileName = meetingRoomImgMapper.selectMeetingRoomImgOne(roomNum);
		log.debug(TeamColor.KMJ+"deleteFileName : " + deleteFileName);
		
		
		// 예약 내역 삭제
		Integer rsvRow = meetingRoomRsvMapper.selectMeetingRoomRsvCntByRoomNo(roomNum);
		boolean deleteRsvResult = false;
		
		if(rsvRow != 0) {// 예약 내역이 존재하면 예약 내역 삭제
			Integer row = meetingRoomRsvMapper.deleteRsvByRoomNo(roomNum);
			
			if(row != 0) {
				deleteRsvResult = true;
			}
			
		}else {// 예약 내역이 없을 경우
			deleteRsvResult = true;
		}
		
		// 이미지 삭제
		boolean deleteImgResult = false;
		
		Integer row = meetingRoomImgMapper.deleteMeetingRoomImg(roomNum);
		
		if(row != 0) {
			deleteImgResult = true;
		}
		
		// 회의실 삭제
		Integer dRow = meetingRoomMapper.deleteMeetingRoomInfo(roomNum);
		boolean deleteResult = false;
		
		if(dRow != 0) {
			deleteResult = true;
		}
		
		if(deleteRsvResult && deleteImgResult && deleteResult) { // 모두 삭제에 성공하면 이미지 파일 삭제
			
			File f = new File(path, deleteFileName); 	// 해당 path에 deleteFileName의 파일 가져옴
			if(f.exists()) {						 	// 파일이 존재한다면
				boolean deleteFileResult = f.delete();	// 파일 삭제
				
				if(deleteFileResult == false) {			// 파일 삭제에 실패한다면  예외 발생시키기
					throw new RuntimeException("파일 삭제에 실패했습니다: " + deleteFileName); // 물리적 파일 삭제는 @transactional이 관리하지 않으므로 실패시 RuntimeException을 만들어줌	
				
				}else {
					result = true;
				}

			}
		}
		
		
		log.debug(TeamColor.KMJ+"result : " + result);
		
		return result;
	}
	
	

}
