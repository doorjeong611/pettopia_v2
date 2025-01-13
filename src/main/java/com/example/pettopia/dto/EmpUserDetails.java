package com.example.pettopia.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.pettopia.vo.Employee;

import lombok.Data;

@Data
public class EmpUserDetails implements UserDetails {

	private final Employee employee;

	public EmpUserDetails(Employee employee) {
		this.employee = employee;
	}

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collection = new ArrayList<>();
		
		collection.add(new GrantedAuthority() { 
			
			@Override
			public String getAuthority() {
				
				
				return employee.getRoleName(); // EmpUserDetailsService에서 반환된 employee에서 확인가능한 값
			}
		});
		
		
		return collection;
    }

	@Override
	public String getPassword() {
		return employee.getEmpPw(); // 사원 비밀번호
	}

	@Override
	public String getUsername() {
		return employee.getEmpNo(); // 사용자 이름 또는 이메일
	}

	@Override
	public boolean isAccountNonExpired() {
		return true; // 계정 만료 여부
	}

	@Override
	public boolean isAccountNonLocked() {
		return true; // 계정 잠금 여부
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true; // 인증 정보 만료 여부
	}

	@Override
	public boolean isEnabled() {
		return true; // 계정 활성화 여부
	}
	
	public Integer getRankNo() {
		return employee.getRankNo();
	}
	
	public String getDeptCode() {
		return employee.getDeptCode();
	}
	
	public String getEmpEmail() {
		return employee.getEmpEmail();
	}
	
	public String getIsTeamLeader() {
		return employee.getIsTeamLeader();

	}
	
	
	
}