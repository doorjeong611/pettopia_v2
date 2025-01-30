package com.example.pettopia.division;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.department.DepartmentMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;


@Controller
@Slf4j
public class DivisionController {
	
	@Autowired DivisionService divisionService;
	@Autowired DepartmentMapper departmentMapper;

	// 부서 조회
	@GetMapping("/employee/divisionList")
	public String getDivisionList(Authentication auth) {
		
		
		return "division/divisionList";
	}
	
	// 부서 등록
	@PostMapping("/admin/addDivision")
	public String addDivision(@RequestParam String divisionCode, @RequestParam String divisionName) {
		
		log.debug(TeamColor.KMJ+"[DivisionController - POST addDivision()]");

		log.debug(TeamColor.KMJ+"divisionName : " + divisionName);
		log.debug(TeamColor.KMJ+"divisionCode : " + divisionCode);
		
		Division division = new Division();
		
		if(divisionName != null && divisionCode != null) {
			division.setDivisionCode(divisionCode.toUpperCase());
			division.setDivisionName(divisionName);
		}
		
		// 부서 등록하기
		Integer row = divisionService.addDivision(division);
		
		log.debug(TeamColor.KMJ + "row : " + row);
		
		if(row == 1) {
			return "division/divisionList";
		}
		
		
		return "division/divisionList";
	}
	
	
	// 부서 수정
	@PostMapping("/admin/modifyDivision")
	public String modifyDivision(@RequestParam String divisionCode, @RequestParam String divisionName) {
		
		log.debug(TeamColor.KMJ+"[DivisionController - POST modifyDivision()]");

		log.debug(TeamColor.KMJ+"divisionName : " + divisionName);
		log.debug(TeamColor.KMJ+"divisionCode : " + divisionCode);

		Division division = new Division();
		
		if(divisionName != null && divisionCode != null) {
			division.setDivisionCode(divisionCode);
			division.setDivisionName(divisionName);
		}
		
		// 부서 수정하기
		Integer row = divisionService.modifyDivisionName(division);
		
		log.debug(TeamColor.KMJ + "row : " + row);
		
		if(row == 1) {
			return "division/divisionList";
		}
		
		
		return "division/divisionList";
		
	}
	
	
	// 부서 삭제
	@PostMapping("/admin/removeDivision")
	public String removeDivision(@RequestParam String divisionCode) {
		
		log.debug(TeamColor.OJY+"[DivisionController - POST removeDivision()]");

		log.debug(TeamColor.KMJ+"divisionCode : " + divisionCode);
		
		Division division = new Division();
		
		if(divisionCode != null) {
			division.setDivisionCode(divisionCode);
		}
		
		
		// 하위 팀이 존재하면 먼저 삭제
		List<Department> existDept = departmentMapper.selectDepartmentList(divisionCode);
		
		if(existDept.size() != 0) { // 하위팀 존재
			Department dept = new Department();
			dept.setDivisionCode(divisionCode);
			
			Integer row = departmentMapper.deleteDepartment(dept);
			
			if(row == 1) {
				// 부서 삭제하기
				Integer result = divisionService.removeDivision(division);
				
				log.debug(TeamColor.KMJ + "result : " + result);
				
				if(result == 1) {
					return "division/divisionList";
				}
			}
			
			
		}else { // 하위팀 없음
			
			// 부서 삭제하기
			Integer result = divisionService.removeDivision(division);
			
			log.debug(TeamColor.KMJ + "result : " + result);
			
			if(result == 1) {
				return "division/divisionList";
			}
		
		}
		
		
		
		
		
		return "division/divisionList";
	}
	
	
	
	
	
	
	
	
	
	
	
}
