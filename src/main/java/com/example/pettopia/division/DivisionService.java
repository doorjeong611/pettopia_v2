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
	
	
	

}
