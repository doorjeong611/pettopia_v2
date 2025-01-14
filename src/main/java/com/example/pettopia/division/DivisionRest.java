package com.example.pettopia.division;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class DivisionRest {
	
	@Autowired DivisionService divisionSerivce;
	
	// 부서 목록 : 직원 등록시 소속 부서 선택시 사용
	@GetMapping("/rest/divisionList")
	public List<Division> getDivisionList() {
		
		log.debug(TeamColor.KMJ + "DivisionRest - getDivisionLIst()");
		log.debug(TeamColor.KMJ + "divisionLIst : " + divisionSerivce.getDivisionList().toString()+TeamColor.RESET);
		
		return divisionSerivce.getDivisionList();
	}

	
}
