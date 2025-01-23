package com.example.pettopia.division;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DivisionService {
	
	@Autowired DivisionMapper divisionMapper;
	
	// 부서 목록 : 직원 등록시 소속 부서 선택시 사용
	public List<Division> getDivisionList() {
		
		List<Division> divisionList = divisionMapper.selectDivisionList();
		
	
		return divisionList;
		
	}
	
	// 부서 등록 
	public Integer addDivision(Division division) {
		
		Integer row = divisionMapper.insertDivision(division);
		
		return row;
	}
	
	// 부서 수정
	public Integer modifyDivisionName(Division division) {
		
		Integer row = divisionMapper.updateDivisionName(division);
		
		return row;
	}
	
	// 부서 삭제
	public Integer removeDivision(Division division) {
		
		Integer row = divisionMapper.deleteDivision(division);
		
		return row;
	}
	
	// 부서 중복검사
	public List<Division> confirmDivision(Division division){
		
		List<Division> diviList = divisionMapper.selectConfirmDivision(division);
		
		return diviList;
	}

}
