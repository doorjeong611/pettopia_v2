package com.example.pettopia.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired NoticeMapper noticeMapper;
	
	// 오자윤 : /notice/addNotice 공지사항 추가
	public void insertNotice(Notice notice) {
		noticeMapper.insertNotice(notice);
	}
	
	// 오자윤 : /notice/addNotice 첨부파일 추가
	public List<NoticeFile> insertNoticeFile(NoticeFile noticeFile) { 
		return noticeMapper.insertNoticeFile(noticeFile);
	}
	
	// 오자윤 : /notice/addNotice 파일첨부 취소
	public List<NoticeFile> findFilesByNoticeNo(NoticeFile noticeFile) {
		return noticeMapper.findFilesByNoticeNo(noticeFile);
	}
	
	// 오자윤 : /notice/addNotice 모든 첨부파일 식제 -->
	public int deleteFilesByNoticeNo(int noticeNo) {
		return noticeMapper.deleteFilesByNoticeNo(noticeNo);
	}
	
	
	// 공지사항 리스트 : 부서 목록
	public List<Division> getDivisionList(){
		
		log.debug(TeamColor.KMJ+"[NoticeService - getDivisionList]");
		
		List<Division> divisionList = noticeMapper.selectDivisionList();
		log.debug(TeamColor.KMJ+ "divisionList : " + divisionList.toString() + TeamColor.RESET);
		
		return divisionList;
				
	}
	
	
	// 공지사항 리스트 : 게시글 목록
	public List<Map<String, Object>> getNoticeList(Map<String, Object> paramMap){ // 카테고리, 검색어 추가하기
		
		log.debug(TeamColor.KMJ+"[NoticeService - getNoticeList]");
		log.debug(TeamColor.KMJ+ "paramMap : " + paramMap.toString() + TeamColor.RESET);		
		
		List<Map<String, Object>> noticeList = noticeMapper.selectNoticeList(paramMap);
		
		log.debug(TeamColor.KMJ+ "noticeList : " + noticeList.toString() + TeamColor.RESET);
		
		return noticeList;
		
	}
	
	
	// 공지사항 상세보기 : 조회수 증가
	public int addNoticeView(Notice notice) {
		
		log.debug(TeamColor.KMJ+"[NoticeService - addNoticeView]");
		log.debug(TeamColor.KMJ+ "NoticeNo : " + notice.getNoticeNo() + TeamColor.RESET);	
		
		return noticeMapper.updateNotice(notice);
		
	}
	
	// 공지사항 상세보기 : 해당 공지사항 조회
	public Map<String, Object> getNoticeOne(int noticeNo) {
		
		log.debug(TeamColor.KMJ+"[NoticeService - addNoticeView]");
		log.debug(TeamColor.KMJ+ "noticeNo : " + noticeNo + TeamColor.RESET);
		
		Map<String, Object> noticeOne = noticeMapper.selectNoticeOne(noticeNo);
		
		return noticeOne; 
		
		
	}
	
	
	

}
