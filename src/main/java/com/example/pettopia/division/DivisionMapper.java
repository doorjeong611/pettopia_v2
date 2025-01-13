package com.example.pettopia.division;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Division;

@Mapper
public interface DivisionMapper {
	
	// 부서 목록 : 직원 등록시 소속 부서 선택시 사용
	List<Division> selectDivisionList();
	
	

}
