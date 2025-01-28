package com.example.pettopia.notice;

import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class NoticeRest {
	@Autowired NoticeService noticeService;
	
	// 오자윤 : /notice/addNotice 공지사항 파일 추가
    @PostMapping("/addFile")
    public NoticeFile addNotice(@ModelAttribute Notice notice,
                                 @RequestParam(value = "file", required = false) MultipartFile file,
                                 Authentication auth) {
        // 관리자 권한 확인
        EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
        String writerEmpNo = empUserDetails.getUsername();

        //  첨부파일 처리 (파일이 있으면)
        if (file != null && !file.isEmpty()) {
            String originalFileName = file.getOriginalFilename();
            String generatedFileName = UUID.randomUUID().toString() + "_" + originalFileName;
            String fileExtension = FilenameUtils.getExtension(originalFileName);

            // 파일 저장 로직 (서버 또는 클라우드 저장소에 저장)
            NoticeFile noticeFile = new NoticeFile();
            noticeFile.setOriginFileName(originalFileName);
            noticeFile.setFileName(generatedFileName);
            noticeFile.setFileExt(fileExtension);
            noticeFile.setFileType(file.getContentType());

            // 파일 DB에 저장 (NoticeFile 객체 생성 후 DB 저장)
            noticeService.insertNoticeFile(noticeFile);

            return noticeFile;  
        }

        return null;  // 파일 업로드 없을시
    }
}