package com.example.pettopia.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.employee.EmployeeMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Service 
@Slf4j
// 로그인 검증을 위해 db에서 정보 조회
public class EmpUserDetailsService implements UserDetailsService{

	// DB에서 가져온 user 정보 검증
	// DB에 접근하기 위해 연결해줘야 함. JPA == repository, mybatis == mapper 사용
	@Autowired private EmployeeMapper employeeMapper;
	
	
	
	
	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
		
		log.debug(TeamColor.KMJ +"EmpUserDetailsService : 로그인 진행 중");
		log.debug(TeamColor.KMJ +"EmpUserDetailsService empNo" + empNo);
		
		Employee emp = employeeMapper.selectEmployeeInfo(empNo);
		if(emp != null) {
			log.debug(TeamColor.KMJ +"성공" );
			log.debug(TeamColor.KMJ +"emp.toString() : " + emp.toString() );
			return new EmpUserDetails(emp); // db 조회시 정보가 있다면 반환하여 로그인 진행 . EmpUserDetails클래스 생성자를 이용하여 직원 정보 넣어서 반환
		}
		
		
		
		return null; // 로그인 실패
	}


	
	
}
