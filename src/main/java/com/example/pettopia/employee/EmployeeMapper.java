package com.example.pettopia.employee;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Employee;

@Mapper
public interface EmployeeMapper {

	// 로그인
	Employee selectEmployeeInfo(String empNo);
	
	// addEmployee : 직원 중복 등록 검증
	Integer selectExistEmployee(String empNo);
	
	// addEmployee : 직원 정보 등록
    Integer insertEmployeeInfo(Employee employee);
	
}
