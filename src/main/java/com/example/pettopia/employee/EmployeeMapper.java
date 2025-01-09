package com.example.pettopia.employee;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Employee;

@Mapper
public interface EmployeeMapper {

	// 로그인
	Employee selectEmployeeInfo(Employee employee);
	
	
}
