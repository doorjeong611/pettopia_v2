package com.example.pettopia.division;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Division;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;


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

	
	// 부서 중복 검사
	@GetMapping("/rest/confirmDivision")
	public String confirmDivision(@RequestParam String divisionCode, @RequestParam String divisionName) {
		
		log.debug(TeamColor.KMJ + "DivisionRest - confirmDivision()");
		
		log.debug(TeamColor.KMJ+"divisionName : " + divisionName);
		log.debug(TeamColor.KMJ+"divisionCode : " + divisionCode);
		
		Division division = new Division();

		if(divisionName != null && divisionCode != null) {
			division.setDivisionCode(divisionCode);
			division.setDivisionName(divisionName);
		}
		
		List<Division> divisionList = divisionSerivce.confirmDivision(division);
		log.debug(TeamColor.KMJ+"divisionList : " + divisionList.toString());
		
		
		if(divisionList.size() > 0) {
			
			for(int i=0; i<divisionList.size(); i++) {
				if(divisionList.get(i).getDivisionCode() != null) {
					return "C"; //"부서코드 중복! 다시 작성해주세요.";
				}
				
				if(divisionList.get(i).getDivisionName() != null) {
					return "N"; // "부서명 중복! 다시 작성해주세요.";
				}
				
			}
			
		}
		
		return "A"; //"부서코드, 부서명 사용 가능";
	}
	

	
	
	
	
}
