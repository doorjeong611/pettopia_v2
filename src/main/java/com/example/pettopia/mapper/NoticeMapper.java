package com.example.pettopia.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Notice;

@Mapper
public interface NoticeMapper {

	// 공지사항 리스트 : 부서 목록
	List<Division> selectDivisionList();
	
	// 공지사항 리스트 : 게시글 목록
	List<Map<String, Object>> selectNoticeList(Map<String, Object> paramMap);
	
	// 공지사항 상세보기 : 조회수 증가
	int updateNotice(Notice notice);
	
	// 공지사항 상세보기 : 해당 공지사항 조회
	Map<String, Object> selectNoticeOne(int noticeNo);
	
	
	
}
