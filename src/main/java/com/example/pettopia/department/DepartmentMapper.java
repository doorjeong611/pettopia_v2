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
	
	// 팀명 중복 검사
	Integer selectConfirmDepartment(String deptName);
	
	// 마지막 deptCode 
	Department selectLastDeptCode(String divisionCode);
	
	// 마지막 내선번호
	String selectLastDeptExt();
	
	// 팀 등록
	Integer insertDepartment(Department dept);
	
	// 팀 이름 수정
	Integer updateDepartmentName(Department dept);
	
	// 팀 삭제
	Integer deleteDepartment(Department dept);
	
}
