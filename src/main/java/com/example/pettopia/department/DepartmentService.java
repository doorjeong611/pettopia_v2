package com.example.pettopia.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.Department;

@Service
public class DepartmentService {
	
	@Autowired DepartmentMapper departmentMapper;
	
	
	// 팀 목록 조회 : 직원 등록시 소속 팀 선택 시 사용
	public List<Department> getDepartmentList(String divisionCode) {
		
		return departmentMapper.selectDepartmentList(divisionCode);
		
	}
	

}
