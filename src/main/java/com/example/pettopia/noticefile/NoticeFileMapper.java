package com.example.pettopia.noticefile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.NoticeFile;

@Mapper
public interface NoticeFileMapper {

	// addDocument → addDocumentFile : 문서 작성 시 문서 파일 추가
	Integer insertNoticeFile(NoticeFile noticeFile);

	// notice/noticeOne : 파일 삭제할 때 파일 정보 가져오기 
	List<NoticeFile> selectNoticeFiles(List<Integer> noticeFileNoList);
	
	// notice/noticeOne : 파일 삭제 하기 -->
	Integer deleteNoticeFile(Integer noticeFileNo);
	
	// notice/noticeOne selectNoticeFileList : 파일 리스트 조회 -->
	List<NoticeFile> selectNoticeFileList(Integer noticeNo);
	
	// documentBinList : 문서 영구삭제 시 파일 삭제를 위한 파일 No 조회
	List<Integer> selectNoticeFileNoList (Integer NoticeNo);


}
