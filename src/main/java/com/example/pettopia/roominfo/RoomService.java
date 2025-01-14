package com.example.pettopia.roominfo;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.PetService;
import com.example.pettopia.vo.RoomImg;
import com.example.pettopia.vo.RoomInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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

