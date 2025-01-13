package com.example.pettopia.rank;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Rank;

@Mapper
public interface RankMapper {

	// 직급 목록 : 직원 등록시 직급 선택
	List<Rank> selectRankList();
	
	
}
