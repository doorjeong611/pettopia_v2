package com.example.pettopia.department;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Department;

@Mapper
public interface DepartmentMapper {
	
	// 팀 목록 조회 : 직원 등록시 소속 팀 선택 시 사용
	List<Department> selectDepartmentList(String divisionCode);

	
	// 조직도
	List<Map<String, Object>> selectOrgChart(String deptCode);
	
}
