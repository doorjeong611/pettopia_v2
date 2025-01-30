package com.example.pettopia.department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DepartmentController {
	
	
	@Autowired DepartmentService departmentService;
	
	// 팀 등록
	@PostMapping("/admin/addDepartment")
	public String addDepartment(@RequestParam String divisionCode, @RequestParam String deptName) {
		
		log.debug(TeamColor.KDH+"[DepartmentController - POST addDepartment()]");

		log.debug(TeamColor.KMJ+"divisionCode : " + divisionCode);
		log.debug(TeamColor.KMJ+"deptName : " + deptName);
		
		// 하위 팀 등록을 위해 해당 부서의 마지막 팀의 부서 코드 가져오기
		Department deptInfo = departmentService.getLastDeptCode(divisionCode);

		String deptCode = "";
		String deptExt = "";

		if(deptInfo != null) {
			String last = deptInfo.getDeptCode();
			String lastDeptCode = last.replaceFirst("^" + divisionCode, ""); // ^는 문자열의 시작
			
			Integer lastDeptCodeNum = Integer.parseInt(lastDeptCode) + 1; // CS02 -> 02 -> 02 + 1 -> 03
			
			log.debug(TeamColor.KMJ+"lastDeptCodeNum : " + lastDeptCodeNum);
			
			if(lastDeptCodeNum < 10) {
				deptCode = divisionCode+"0"+lastDeptCodeNum;
				log.debug(TeamColor.KMJ+"deptCode : " + deptCode);
			}else {
				deptCode = divisionCode + lastDeptCodeNum;
				log.debug(TeamColor.KMJ+"deptCode : " + deptCode);
			}
			
			// 내선번호 등록
			Integer deptExtNum = Integer.parseInt(deptInfo.getDeptExt()) + 1;
			deptExt = deptExtNum + "";

		}else {
			
			deptCode = divisionCode + "01";
			log.debug(TeamColor.KMJ+"deptCode : " + deptCode);
			
			String lastExt = departmentService.getLastDeptExt();
			
			Integer lastExtNum = Integer.parseInt(lastExt.substring(0, 2));

			log.debug(TeamColor.KMJ+"lastExtNum : " + lastExtNum);
			
			if(lastExtNum < 90) {
				
				lastExtNum = lastExtNum + 10;
				deptExt = lastExtNum + "01";
				
			}else if(lastExtNum == 90) {
				
				lastExtNum = lastExtNum + 10;
				deptExt = lastExtNum + "001";
				
			}
			
			
		}
		
		Department dept = new Department();
		dept.setDivisionCode(divisionCode);
		dept.setDeptName(deptName);
		dept.setDeptCode(deptCode);
		dept.setDeptExt(deptExt);
		
		log.debug(TeamColor.KMJ+"등록할 부서 : " + dept.toString());
		
		
		// 팀 등록하기
		Integer result = departmentService.addDepartment(dept);
		
		if(result != 0) {
			return "division/divisionList";
		}
		
		
		
		return "division/divisionList";
	}
	
	
	// 팀 이름 수정
	@PostMapping("/admin/modifyDepartment")
	public String modifyDepartment(@RequestParam String deptCode, @RequestParam String deptName) {
		
		log.debug(TeamColor.KDH+"[DepartmentController - POST modifyDepartment()]");

		log.debug(TeamColor.KMJ+"deptCode : " + deptCode);
		log.debug(TeamColor.KMJ+"deptName : " + deptName);
		
		Department department = new Department();
		department.setDeptName(deptName);
		department.setDeptCode(deptCode);
		
		Integer row = departmentService.modifyDepartmentName(department);
		
		log.debug(TeamColor.KMJ + "row : " + row);
		
		if(row == 1) {
			return "division/divisionList";
		}
		
		
		return "division/divisionList";
		

	}
	
	// 팀 삭제
	@PostMapping("/admin/removeDepartment")
	public String removeDepartment(@RequestParam String deptCode) {
		log.debug(TeamColor.LJH+"[DepartmentController - POST modifyDepartment()]");

		log.debug(TeamColor.KMJ+"deptCode : " + deptCode);
		
		Department dept = new Department();
		dept.setDeptCode(deptCode);
		
		
		Integer row = departmentService.deleteDepartment(dept);
		
		if(row == 1) {
			return "division/divisionList";
		}
		
		return "division/divisionList";
	}
	
	
	
	

}
