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
	public Integer removeNoticeFile(Integer NoticeFileNo, String path) {
		NoticeFile noticeFile = noticeFileMapper.selectNoticeFileOne(NoticeFileNo);
		
		Integer removeNoticeFileRow = noticeFileMapper.deleteNoticeFile(NoticeFileNo);
		
		if(removeNoticeFileRow == 1) {
			String fullname = path + noticeFile.getFileName() + "." + noticeFile.getFileExt();
			File file = new File(fullname);
			file.delete();
		}
		return 1;
	}

}
