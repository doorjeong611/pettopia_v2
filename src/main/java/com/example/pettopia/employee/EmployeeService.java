package com.example.pettopia.employee;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.employeefile.EmployeeFileMapper;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeFile;
import com.example.pettopia.vo.EmployeeForm;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class EmployeeService {
	
	@Autowired EmployeeMapper employeeMapper;
	@Autowired EmployeeFileMapper employeeFileMapper;
	
	@Autowired JavaMailSender javaMailSender;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
	
	
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
	
	// addEmployee : 최근 입사한 사원의 사번 조회
	public String getLatestEmpNo() {
		log.debug(TeamColor.KMJ + "EmployeeService - getLatestEmpNo() " );
		
		String latestEmpNo = employeeMapper.selectLatestEmpNo();
		log.debug(TeamColor.KMJ + "latestEmpNo : " + latestEmpNo);
		
		return latestEmpNo;
	}
	
	
	
	// addEmployee : 직원 등록
	public boolean addEmployee(EmployeeForm employeeForm, String path) {
		log.debug(TeamColor.KMJ + "EmployeeService - addEmployee() " );
		
		// employee 테이블 직원 등록
		Employee employee = new Employee();
		employee.setEmpNo(employeeForm.getEmpNo());
		log.debug(TeamColor.KMJ + "employeeForm.getEmpNo() " + employeeForm.getEmpNo());
		log.debug(TeamColor.KMJ + "employeeForm.getEmpPw() " + employeeForm.getEmpPw());
		
		employee.setEmpPw(bCryptPasswordEncoder.encode(employeeForm.getEmpPw()));
		log.debug(TeamColor.KMJ + "bCryptPasswordEncoder 후 비밀번호 : " + employee.getEmpPw());
		
		// 이름, 이메일, 생년월일, 성별
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
		log.debug(TeamColor.KMJ + "resultRow :" + resultRow);
		
		int fileResultRow = 0;
		
		
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
			
			fileResultRow = employeeFileMapper.insertEmployeeProfile(employeeFile);
			log.debug(TeamColor.KMJ + "fileResultRow :" + fileResultRow);
			
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
		
		if(resultRow == 1 && fileResultRow == 1) { // 직원 등록 성공 == true
			return true;
		}else{
			return false;						   // 직원 등록 실패 == false
		}
		
		
	}
	
	
	// 직원 등록 성공시 메일 전송
	public boolean sendMailEmployeeInfo(Employee employee) {
		log.debug(TeamColor.KMJ + "EmployeeService - sendMailEmployeeInfo() " );
		
		String empNo = employee.getEmpNo();
		String empName = employee.getEmpName();
		String empPw = employee.getEmpPw();
		String empEmail = employee.getEmpEmail();
		
		
		String subject = "PetTopia Co. 펫토피아 신규 사원 공지";
		String htmlContent = "<html>" +
			    "<body style='font-family: Arial, sans-serif; color: #333;'>" +
			    "<div style='max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f4f4f9; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);'>" +
			    "<h1 style='color: #f15b2a; text-align: center;'>입사를 진심으로 축하드립니다, " + empName + "님!</h1>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>안녕하세요, " + empName + "님!</p>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>귀하의 사원 번호는 <b>" + empNo + "</b>입니다.</p>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>임시 비밀번호는 <b>" + empPw + "</b>입니다.</p>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>아래의 버튼을 클릭하여 비밀번호를 변경해주세요.</p>" +
			    "<p style='text-align: center;'>" +
			    "<form action='http://localhost/pettopia/changePassword' method='post'>" +
			    "<input type='submit' value='비밀번호 변경하기' style='display: inline-block; padding: 15px 30px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; font-size: 18px; font-weight: bold; text-align: center; border: none;'>" +
			    "<input type='hidden' name='empNo' value='" + empNo + "'>" +
			    "<input type='hidden' name='empPw' value='" + empPw + "'>" +
			    "</form>" +
			    "</p>" +
			    "<p style='font-size: 14px; text-align: center; color: #666;'>이 이메일은 자동으로 발송된 시스템 메시지입니다.</p>" +
			    "</div>" +
			    "</body>" +
			    "</html>";

		 MimeMessage message = javaMailSender.createMimeMessage();
	        try {
	            MimeMessageHelper helper = new MimeMessageHelper(message, true); 
	            helper.setTo(empEmail);
	            helper.setSubject(subject);
	            helper.setFrom("pettopia.corp@gmail.com");
	            helper.setText(htmlContent, true); 

	            javaMailSender.send(message);

	            log.debug("메일 전송 성공!");
	            return true;

	        } catch (Exception e) {
	        	log.debug("메일 전송 실패!");
	        	e.printStackTrace();
	        	 return false;
	        }     
	       
	  }
	 
	// 직원 목록 조회
	public List<Map<String, Object>> getEmployeeList(){
		log.debug(TeamColor.KMJ + "EmployeeService - getEmployeeList() " );
		
		List<Map<String, Object>> empList =  employeeMapper.selectEmployeeList();
		log.debug(TeamColor.KMJ + "empList [0]" + empList.get(0).toString());
		
		
		return empList;
	}
	

}// employeeService
