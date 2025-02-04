package com.example.pettopia.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.pettopia.vo.Employee;

import lombok.Data;

@Data
public class EmpUserDetails implements UserDetails {

	private final Employee employee;
	private final Map<String, Object> employeeFile;


	public EmpUserDetails(Employee employee, Map<String, Object> employeeFile) {
		this.employee = employee;
		this.employeeFile = employeeFile;

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
	
	// 이름
	public String getEmpName() {
		return employee.getEmpName();
	}
	
	// 이메일
	public String getEmpEmail() {
		return employee.getEmpEmail();
	}
	
	// 생일
	public String getEmpBirth() {
		return employee.getEmpBirth();
	}
	
	// 성별
	public String getEmpGender() {
		return employee.getEmpGender();
	}
	
	// 전화번호
	public String getEmpPhone() {
		return employee.getEmpPhone();
	}
	
	// 우편번호
	public String getPosalCode() {
		return employee.getPostalCode();
	}
	
	// 기본주소
	public String getBasicAddress() {
		return employee.getBasicAddress();
	}
	
	// 상세주소
	public String getDetailAddress() {
		return employee.getDetailAddress();
	}
	
	// 직원 상태
	public String getEmpStatus() {
		return employee.getEmpStatus();
	}
	
	// 팀장 여부
	public String getIsTeamLeader() {
		return employee.getIsTeamLeader();
	}
	
	// 부서
	public String getDeptCode() {
		return employee.getDeptCode();
	}
	
	// 직급
	public Integer getRankNo() {
		return employee.getRankNo();
	}
	
	// 직원 권한
	public String getRoleName() {
		return employee.getRoleName();
	}
	
	// 입사일
	public String getHireDate() {
		return employee.getHireDate();
	}
	
	// 퇴사일
	public String getResignationDate() {
		return employee.getResignationDate();
	}
	
	// 생성일시
	public String getCreateDatetime() {
		return employee.getCreateDatetime();
	}
	
	// 수정일시
	public String getUpdateDatetime() {
		return employee.getUpdateDatetime();
	}
	
	// 프로필 사진
	public String getEmpFileName() {
	    return (String) employeeFile.get("empFileName"); 
	}
	
	// 부서명
	public String getDivisionName() {
		return (String) employeeFile.get("divisionName"); 
	}

	// 부서명
	public String getDeptName() {
		return (String) employeeFile.get("deptName"); 
	}
	
	// 직급
	public String getRankName() {
		return (String) employeeFile.get("rankName"); 
	}
		

	
	
	
	
}