package com.example.pettopia.employee;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.employeefile.EmployeeFileMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeFile;
import com.example.pettopia.vo.EmployeeForm;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class EmployeeService {
	
	@Autowired EmployeeMapper employeeMapper;
	@Autowired EmployeeFileMapper employeeFileMapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
	// 로그인
//	public Map<String, Object> getEmployeeInfo(Employee employee) {
//		
//		log.debug(TeamColor.KMJ+"[EmployeeService - getEmployeeInfo]");
//		log.debug(TeamColor.KMJ+ "empNo : " + employee.getEmpNo());
//		log.debug(TeamColor.KMJ+ "password : " + employee.getEmpPw());
//		
//		Employee loginEmp = employeeMapper.selectEmployeeInfo(employee);
//		
//		boolean loginFlag = false;
//		Map<String, Object> login = new HashMap<>();
//
//		
//		// 로그인 성공 
//		if(loginEmp != null && !loginEmp.getEmpStatus().equals("R")) { // 사번과 비밀번호가 db 정보와 일치하고 퇴사자가 아닌 직원
//			log.debug(TeamColor.KMJ+ "loginEmp.getEmpStatus() : " + loginEmp.getEmpStatus() + TeamColor.RESET);
//			loginFlag = true;
//			login.put("loginEmp", loginEmp); // 로그인 성공한 사원의 정보 담기
//			login.put("loginFlag", loginFlag);
//			
//			return login;
//		}
//		
//		// 로그인 실패
//		login.put("loginFlag", loginFlag);
//		
//		return login;
//		
//				
//	}
	
	// addEmployee : 중복 직원 검증
	public Boolean getExistEmployee(String empNo) {
		log.debug(TeamColor.KMJ + "EmployeeService - getExistEmployee() " );
		
		Boolean existEmp = false; // false == 존재하는 회원, true == 등록 가능한 회원

		Integer existEmpCnt = employeeMapper.selectExistEmployee(empNo);
		
		if(existEmpCnt == 0) {
			
			existEmp = true;
			
			log.debug(TeamColor.KMJ + "등록 가능! existEmp : " + existEmp);
			return existEmp;
		}
		
		log.debug(TeamColor.KMJ + "중복된 사번! existEmp : " + existEmp + TeamColor.RESET);
		
		
		return existEmp;
	}
	
	
	// addEmployee : 직원 등록
	public void addEmployee(EmployeeForm employeeForm, String path) {
		log.debug(TeamColor.KMJ + "EmployeeService - addEmployee() " );
		
		// employee 테이블 직원 등록
		Employee employee = new Employee();
		employee.setEmpNo(employeeForm.getEmpNo());
		log.debug(TeamColor.KMJ + "employeeForm.getEmpNo() " + employeeForm.getEmpNo());
		
		employee.setEmpPw(bCryptPasswordEncoder.encode(employeeForm.getEmpPw()));
		employee.setEmpName(employeeForm.getEmpName());
		employee.setEmpEmail(employeeForm.getEmpEmail());
		employee.setEmpBirth(employeeForm.getEmpBirth());
		employee.setEmpGender(employeeForm.getEmpGender());
		
		// 연락처 
		String empPhone = employeeForm.getEmpPhoneF()+"-"+employeeForm.getEmpPhoneM()+"-"+employeeForm.getEmpPhoneL();
		log.debug(TeamColor.KMJ + "empPhone " + empPhone);
		employee.setEmpPhone(empPhone);
		
		// 주소
		String detailAddress = employeeForm.getDetailAddress() + "_" +employeeForm.getDong();
		log.debug(TeamColor.KMJ + "detailAddress " + detailAddress + TeamColor.RESET);
		employee.setPostalCode(employeeForm.getPostalCode());
		employee.setBasicAddress(employeeForm.getBasicAddress());
		employee.setDetailAddress(detailAddress);
		
		// 팀 리더 여부
		String isTeamLeader = "";
		if(employeeForm.getRankNo() >= 50) {
			isTeamLeader = "H";
			employee.setIsTeamLeader(isTeamLeader);
		}else {
			employee.setIsTeamLeader(null);
		}
		
		// 재직 상태는 insert =  기본값 'T'
		
		// 직급
		log.debug(TeamColor.KMJ + "employeeForm rankNo :" + employeeForm.getRankNo());
		employee.setRankNo(employeeForm.getRankNo());
		
		
		// role
		if(employeeForm.getRankNo() >= 40 ) {
			employee.setRoleName("ROLE_ADMIN");
		}else {
			employee.setRoleName("ROLE_EMP");
		}
		
		employee.setDeptCode(employeeForm.getDeptCode());
		employee.setHireDate(employeeForm.getHireDate());
		employee.setResignationDate(null);
		
		// 직원 정보 insert
		Integer resultRow = employeeMapper.insertEmployeeInfo(employee); 
		
		// <select Key> 값
		String empNo = employeeForm.getEmpNo();
		
		log.debug(TeamColor.KMJ + "empNo :" + empNo);
		
		
		// 직원 정보 등록 성공시
		if(resultRow == 1 && employeeForm.getEmployeeFile() != null) {
			
			// 프로필 사진 등록
			MultipartFile empFile = employeeForm.getEmployeeFile();
			
			int dotIndex = empFile.getOriginalFilename().lastIndexOf(".");					// 확장자와 파일명 구분을 위한 . 인덱스 찾기
			String orginFileName = empFile.getOriginalFilename().substring(0, dotIndex);	// 원본파일명
			String fileName = UUID.randomUUID().toString().replace("-", "");				// 랜덤으로 생성한 파일명
			String ext = empFile.getOriginalFilename().substring(dotIndex);					// 확장자 (.jpg)
			String filePurpose = "P";														// 파일 목적 (P : 프로필사진)
			
			log.debug(TeamColor.KMJ + "dotIndex :" + dotIndex);
			log.debug(TeamColor.KMJ + "orginFileName :" + orginFileName);
			log.debug(TeamColor.KMJ + "fileName :" + fileName);
			log.debug(TeamColor.KMJ + "ext :" + ext);
			
			EmployeeFile employeeFile = new EmployeeFile();
			employeeFile.setEmpNo(empNo);
			employeeFile.setOriginFileName(orginFileName);
			employeeFile.setFileName(fileName);
			employeeFile.setFileExt(ext);
			employeeFile.setFilePurpose(filePurpose);
			employeeFile.setFileType(empFile.getContentType());
			
			int fileResultRow = employeeFileMapper.insertEmployeeProfile(employeeFile);
			
			if(fileResultRow == 1) {
				// 물리적 파일 저장하기
				try {
					empFile.transferTo(new File(path + fileName + ext)); // /employeeFile/manggom.jpg
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}

		}
		
		
		
		
	}
	

}
