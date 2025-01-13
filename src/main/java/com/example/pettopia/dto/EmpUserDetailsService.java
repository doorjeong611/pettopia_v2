package com.example.pettopia.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.pettopia.employee.EmployeeMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpUserDetailsService implements UserDetailsService {

	@Autowired EmployeeMapper employeeMapper;

	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
		Employee employee = employeeMapper.selectEmployeeInfo(empNo);
		EmpUserDetails details = new EmpUserDetails(employee);
		log.debug(TeamColor.KMJ + "details:--------------"+details.toString() + TeamColor.RESET);
		
		
		return details;
	}
}
