package com.example.pettopia.noticefile;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.NoticeFile;

@Service
public class NoticeFileService {
	
	@Autowired NoticeFileMapper noticeFileMapper;
	
	// notice/noticeOne selectNoticeFileList : 파일 리스트 조회
	public List<NoticeFile> getNoticeFileList(Integer noticeNo){
		return noticeFileMapper.selectNoticeFileList(noticeNo);
	}
	
	
	// noticeOne → removeNoticeFile : 첨부파일 삭제 하기
	public Integer removeNoticeFile(Integer noticeFileNo, String path, List<Integer> noticeFileNoList) {
		 // 파일 정보를 리스트로 가져오기
	    List<NoticeFile> noticeFiles = noticeFileMapper.selectNoticeFiles(noticeFileNoList);
	    
	    // 파일 정보가 존재할 경우
	    if (!noticeFiles.isEmpty()) {
	        NoticeFile noticeFile = noticeFiles.get(0); // 첫 번째 파일 정보 가져오기
	        
	        // 데이터베이스에서 파일 삭제
	        Integer removeNoticeFileRow = noticeFileMapper.deleteNoticeFile(noticeFileNo);
	        
	        if (removeNoticeFileRow == 1) {
	            String fullname = path + noticeFile.getFileName() + "." + noticeFile.getFileExt();
	            File file = new File(fullname);
	            
	            // 파일 존재 여부 확인 후 삭제
	            if (file.exists()) {
	                file.delete();
	            }
	        }
	    }
	    
	    return 1; // 성공적으로 처리된 경우 1 반환
	}
}