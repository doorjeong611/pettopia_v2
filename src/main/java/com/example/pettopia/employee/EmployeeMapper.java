package com.example.pettopia.employee;

import java.util.List;
import java.util.Map;

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
	
    // employeeList : 직원 목록 조회
    List<Map<String, Object>> selectEmployeeList();
    
    // addEmployee : 최근 입사한 사원 조회
    String selectLatestEmpNo();
    
    // sendTempPassword : 입력한 사번, 이메일 일치 여부 조회
    Employee selectSimpleEmpInfo(Employee employee);
    
    // 직원 정보 수정 : sendTmepPassword - 직원 비밀번호 수정
    Integer updateEmployee(Employee employee);
    
    
}
