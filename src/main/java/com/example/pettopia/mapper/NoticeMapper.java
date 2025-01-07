package com.example.pettopia.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Division;

@Mapper
public interface NoticeMapper {

	// 공지사항 리스트 : 부서 목록
	List<Division> selectDivisionList();
	
	// 공지사항 리스트 : 게시글 목록
	List<Map<String, Object>> selectNoticeList(Map<String, Object> paramMap);
	
	
	
}
