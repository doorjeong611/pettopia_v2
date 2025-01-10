package com.example.pettopia.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.pettopia.vo.Employee;

// db로부터 넘어온 사용자의 정보를 담아서 로그인 폼에서 넘어온 정보와 비교하기 위해 security에 맞춰주기 위한 클래스
// Spring Security는 로그인 성공 후, 인증된 사용자의 권한을 확인할 때 getAuthorities()를 호출하여 확인
public class EmpUserDetails implements UserDetails{
	
	private Employee employee; // 로그인을 위해 정보를 받기 위해 필요한 필드.
	
	// 생성자
	public EmpUserDetails(Employee employee) {
		this.employee = employee;
	}
	
	
	
	
	// role
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collection = new ArrayList<>();
		
		collection.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				
				return employee.getRoleName(); // EmpUserDetailsService에서 반환된 값.
				
			}
		});
	
		
		
		return collection;
	}
	
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return employee.getEmpPw();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return employee.getEmpNo();
	}



	// 그 외 부가정보 : 사용시 db에 컬럼을 추가하여 값 가져오면 됨
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true; // 현재는 강제로 만료되지 않았다고 설정
	}




	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}




	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}




	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	} 
	
	
	
	
	
	
	

}
