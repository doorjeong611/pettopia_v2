package com.example.pettopia.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.pettopia.employee.EmployeeMapper;
import com.example.pettopia.message.MessageMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpUserDetailsService implements UserDetailsService {

	@Autowired EmployeeMapper employeeMapper;
	@Autowired MessageMapper messageMapper;

	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
		Employee employee = employeeMapper.selectEmployeeInfo(empNo);
		Map<String, Object> empFile = employeeMapper.selectEmployeeOne(empNo);
		

		EmpUserDetails details = new EmpUserDetails(employee, empFile);
		log.debug(TeamColor.KMJ + "details:--------------"+details.toString() + TeamColor.RESET);
		
		
		return details;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
