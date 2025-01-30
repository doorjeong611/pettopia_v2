package com.example.pettopia.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Notice;
import com.example.pettopia.vo.NoticeFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class NoticeService {
	
	@Autowired NoticeMapper noticeMapper;
	
	// 오자윤 : /notice/addNotice 공지사항 추가
	public Integer insertNotice(Notice notice) {
		return noticeMapper.insertNotice(notice); // 공지사항 저장 후 ID반환
	}
	
	// 오자윤 : /notice/addNotice 공지사항 파일 추가
	@Transactional
	 public void saveFiles(final Integer noticeId, final List<NoticeFile> files) {
        if (CollectionUtils.isEmpty(files)) {
            return;
        }
        for (NoticeFile file : files) {
            // NoticeFile 객체 생성 및 설정
        	file.setNoticeNo(noticeId); // 공지사항 ID 설정
        }
            noticeMapper.saveAll(files); // 파일 저장
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
