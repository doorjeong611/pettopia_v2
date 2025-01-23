package com.example.pettopia.division;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Division;

@Mapper
public interface DivisionMapper {
	
	// 부서 목록 : 직원 등록시 소속 부서 선택시 사용
	List<Division> selectDivisionList();
	
	// 부서 등록 
	Integer insertDivision(Division division);
	
	// 부서 수정
	Integer updateDivisionName(Division division);
	
	// 부서 삭제
	Integer deleteDivision(Division division);
	
	// 부서 중복 검사
	List<Division> selectConfirmDivision(Division Division);

}
