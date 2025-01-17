package com.example.pettopia.roominfo;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.PetService;
import com.example.pettopia.vo.RoomImg;
import com.example.pettopia.vo.RoomInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class RoomService {
	@Autowired
    private RoomMapper roomMapper;

	// 객실 수정
	public void updateRoomWithImage(RoomInfo roomInfo, MultipartFile roomImg, String uploadPath) throws Exception {
	    // 1. 객실 정보 업데이트
	    int updateResult = roomMapper.updateRoomInfo(roomInfo);
	    if (updateResult == 0) {
	        throw new RuntimeException("객실 정보 수정 실패");
	    }
	    log.debug("객실 정보 수정 완료: {}", roomInfo);

	    // 2. 이미지 업데이트 처리
	    if (roomImg != null && !roomImg.isEmpty()) {
	        RoomImg roomImage = new RoomImg();
	        roomImage.setRoomNo(roomInfo.getRoomNo());
	        roomImage.setOriginFileName(roomImg.getOriginalFilename());

	        String fileName = UUID.randomUUID() + "." + getFileExtension(roomImg.getOriginalFilename());
	        roomImage.setFileName(fileName);
	        roomImage.setFileExt(getFileExtension(roomImg.getOriginalFilename()));
	        roomImage.setFileType(roomImg.getContentType());

	        // 이미지 업데이트
	        int imgUpdateResult = roomMapper.updateRoomImg(roomImage);
	        if (imgUpdateResult == 0) {
	            throw new RuntimeException("이미지 수정 실패");
	        }
	        log.debug("객실 이미지 수정 완료: {}", roomImage);

	        // 파일 저장
	        File saveFile = new File(uploadPath, fileName);
	        roomImg.transferTo(saveFile);
	    }
	}
	
	// 전체 객실 리스트 조회
    public List<RoomInfo> getRoomList() {
        return roomMapper.selectRoom();
    }
    
    // 전체 객실 이미지 조회
    public List<RoomImg> roomImgService() {
        return roomMapper.selectRoomImg();
    }
    
    // 상세보기
    public Map<String, Object> selectRoomOne(Integer roomNo) {
		return roomMapper.selectRoomOne(roomNo);
	}
    
    // 객실 등록
    public int addRoomInfo(RoomInfo roomInfo) {
    	return roomMapper.insertRoomInfo(roomInfo);
    }
    
 // 객실 이미지 등록
    public int addRoomImg(RoomImg roomImg) {
        return roomMapper.insertRoomImg(roomImg);
    }
    
 // 객실 정보와 이미지를 등록하는 서비스 메서드
    public void addRoomWithImage(RoomInfo roomInfo, MultipartFile roomImg, String uploadPath) throws Exception {
        // 1. 객실 정보 등록
        int roomInsertResult = addRoomInfo(roomInfo); // DB에 객실 정보 저장
        if (roomInsertResult == 0) {
            throw new RuntimeException("객실 등록 실패");
        }
        log.debug(TeamColor.WJ + "RoomNo ========> " + roomInfo.getRoomNo() + TeamColor.RESET);

        // 2. 이미지 처리
        if (roomImg != null && !roomImg.isEmpty()) {
            RoomImg roomImage = new RoomImg();
            roomImage.setRoomNo(roomInfo.getRoomNo()); // 등록된 객실 번호 설정
            roomImage.setOriginFileName(roomImg.getOriginalFilename());

            // 고유 파일명 생성
            String fileName = UUID.randomUUID().toString() + "." + getFileExtension(roomImg.getOriginalFilename());
            roomImage.setFileName(fileName);
            roomImage.setFileExt(getFileExtension(roomImg.getOriginalFilename()));
            roomImage.setFileType(roomImg.getContentType());

            // 이미지 정보 DB 저장
            int imgInsertResult = addRoomImg(roomImage);
            if (imgInsertResult == 0) {
                throw new RuntimeException("이미지 등록 실패");
            }
            log.debug(TeamColor.WJ + "FileName ========> " + roomImage.getFileName() + TeamColor.RESET);

            // 실제 파일 저장
            File saveFile = new File(uploadPath, fileName);
            roomImg.transferTo(saveFile);
            log.debug(TeamColor.WJ + "Path ========> " + saveFile.getAbsolutePath() + TeamColor.RESET);
        }
    }

    // 파일 확장자 추출 메서드
    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex == -1) {
            return ""; // 확장자가 없는 경우
        }
        return fileName.substring(dotIndex + 1);
    }
    
    public List<Map<String, Object>> getRoomListWithImages() {
        return roomMapper.selectRoomWithImages();
    }
    
}

