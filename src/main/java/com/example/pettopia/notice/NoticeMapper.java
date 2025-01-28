package com.example.pettopia.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;

@Mapper
public interface NoticeMapper {
	
	// 오자윤 : /notice/addNotice 공지사항 추가
	void insertNotice(Notice notice);
	
	// 오자윤 : /notice/addNotice 첨부파일 추가
	public List<NoticeFile> insertNoticeFile(NoticeFile noticeFile);
	
	// 오자윤 : /notice/addNotice 파일첨부 취소
	public List<NoticeFile> findFilesByNoticeNo(NoticeFile noticeFile);
	
	// 오자윤 : /notice/addNotice 모든 첨부파일 식제 -->
	int deleteFilesByNoticeNo(int noticeNo);
	
	// 공지사항 리스트 : 부서 목록
	List<Division> selectDivisionList();
	
	// 공지사항 리스트 : 게시글 목록
	List<Map<String, Object>> selectNoticeList(Map<String, Object> paramMap);
	
	// 공지사항 상세보기 : 조회수 증가
	int updateNotice(Notice notice);
	
	// 공지사항 상세보기 : 해당 공지사항 조회
	Map<String, Object> selectNoticeOne(int noticeNo);
	
	
}
