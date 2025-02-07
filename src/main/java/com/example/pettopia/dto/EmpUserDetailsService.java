package com.example.pettopia.dto;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.pettopia.employee.EmployeeMapper;
import com.example.pettopia.message.MessageMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpUserDetailsService implements UserDetailsService {

	@Autowired EmployeeMapper employeeMapper;
	@Autowired MessageMapper messageMapper;

	/**
	 * 이 메서드는 Spring Security의 UserDetailsService 인터페이스를 구현한 메서드로,
	 * 주어진 empNo(직원 번호)를 기반으로 사용자의 세부 정보를 로드하여 인증 및 인가에 사용되는 UserDetails 객체를 반환합니다.
	 * 
	 * @param empNo 사용자 이름 (여기서는 직원 번호)
	 * @return UserDetails Spring Security에서 요구하는 사용자 정보를 담고 있는 객체
	 * @throws UsernameNotFoundException empNo로 사용자 정보를 찾을 수 없을 경우 던져짐
	 */
	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
	    
	    // empNo를 사용하여 DB에서 직원 정보를 조회 (예: 직원 이름, 이메일 등)
	    Employee employee = employeeMapper.selectEmployeeInfo(empNo);
	    
	    
	    if (employee == null) {
	        throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: ");
	    }
	    
	    
	    // empNo를 사용하여 직원과 관련된 추가 정보를 조회 (예: 파일 관련 정보 등)
	    Map<String, Object> empFile = employeeMapper.selectEmployeeOne(empNo);
	    
	    // Employee 객체와 추가 정보를 바탕으로 EmpUserDetails 객체 생성
	    // EmpUserDetails는 Spring Security의 UserDetails를 구현한 커스텀 클래스
	    EmpUserDetails details = new EmpUserDetails(employee, empFile);
	    
	    // 디버그 로그로 EmpUserDetails 객체의 내용을 출력하여 디버깅에 사용
	    log.debug(TeamColor.KMJ + "details:--------------" + details.toString() + TeamColor.RESET);
	    
	    
	    // 생성된 EmpUserDetails 객체를 반환하여 Spring Security의 인증 시스템에 사용
	    return details;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
