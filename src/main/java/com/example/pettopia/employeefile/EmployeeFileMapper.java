package com.example.pettopia.employeefile;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.EmployeeFile;

@Mapper
public interface EmployeeFileMapper {
	
	// addEmployee : 직원 프로필 사진 등록
	Integer insertEmployeeProfile(EmployeeFile employeeFile);

}
