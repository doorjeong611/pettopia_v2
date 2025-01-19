package com.example.pettopia.employeefile;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.EmployeeFile;

@Mapper
public interface EmployeeFileMapper {
	
	// addEmployee : 직원 프로필 사진 등록
	Integer insertEmployeeFile(EmployeeFile employeeFile);
	
	// modifyEmployeeOne : 직원 프로필 사진 수정
	Integer updateEmployeeFile(EmployeeFile employeeFile);
	
	// modifyEmployeeOne : 물리적 파일 삭제를 위해 db에 저장된 이름 가져오기
	EmployeeFile selectEmployeeFile(Integer empFileNo);

}
