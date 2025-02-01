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
	
	
	

}
