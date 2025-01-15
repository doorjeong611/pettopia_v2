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
    
    
    // 객실 등록 (이미지 갖고 오려다 실패한 버전)
//    public void addRoom(RoomInfo roomInfo, String path) {
//        int row1 = roomMapper.insertRoom(roomInfo);
//        Integer roomNo = roomInfo.getRoomNo(); // insert된 room no 받아오기
//        log.debug(TeamColor.WJ + "roomNo =====> " + roomNo + TeamColor.RESET);
//
//        if (row1 == 1 && roomInfo.getRoomFiles() != null) {
//            List<MultipartFile> roomFiles = roomInfo.getRoomFiles(); // RoomInfo에 파일 리스트 추가 필요
//            for (MultipartFile mf : roomFiles) {
//                RoomImg roomImg = new RoomImg();
//                roomImg.setRoomNo(roomNo);
//                roomImg.setFileType(mf.getContentType());
//                String filename = UUID.randomUUID().toString().replace("-", "");
//                roomImg.setFileName(filename);
//                log.debug(TeamColor.WJ + "roomFiles =====> " + filename + TeamColor.RESET);
//                int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
//                String originName = mf.getOriginalFilename().substring(0, dotIdx);
//                String ext = mf.getOriginalFilename().substring(dotIdx + 1);
//                roomImg.setOriginFileName(originName);
//                roomImg.setFileExt(ext);
//
//                int row2 = roomMapper.insertRoomImg(roomImg);
//                if (row2 == 1) {
//                    try {
//                        mf.transferTo(new File(path + filename + "." + ext));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                        throw new RuntimeException(); // 예외 발생 시 롤백
//                    }
//                }
//            }
//        }
//    }
}
    
    // 룸 타입 ENUM 값 추출
//    public List<String> getRoomTypes() {
//    	List<String> enumList = roomMapper.selectRoomTypeEnum(); // "enum('S','D','ST','F')"
//        return Arrays.asList(enumList.replace("'", "").split(","));
//    }

