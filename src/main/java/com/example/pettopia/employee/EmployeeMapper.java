package com.example.pettopia.employee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Employee;

@Mapper
public interface EmployeeMapper {

	// login : 로그인
	Employee selectEmployeeInfo(String empNo);
	
	// addEmployee : 직원 중복 등록 검증
	Integer selectExistEmployee(String empNo);
	
	// addEmployee : 직원 정보 등록
    Integer insertEmployeeInfo(Employee employee);
	
    // employeeList : 직원 목록 조회를 위한 부서, ROLE 가져오기
    Map<String , Object> selectEmpDivRoleInfo(String empNo);
    
    // employeeList : 직원 목록 조회
    List<Map<String, Object>> selectEmployeeList(Map<String, Object> params);
    
    // addEmployee : 최근 입사한 사원 조회
    String selectLatestEmpNo();
    
    // sendTempPassword : 입력한 사번, 이메일 일치 여부 조회
    Employee selectSimpleEmpInfo(Employee employee);
    
    // modifyEmployeeOne : 직원 정보 수정, 
    // sendTmepPassword : 직원 비밀번호 수정
    // modifyEmployeeSummary : 직원 직급(팀장여부), 부서, 재직상태 수정
    Integer updateEmployee(Employee employee);
    
    // employeeOne : 직원 개인 정보 상세보기
    Map<String, Object> selectEmployeeOne(String empNo);
    
    // employeeSummary : 직원 공식 정보 상세보기
    Map<String, Object> selectEmployeeSummary(String empNo);
    
    
}
