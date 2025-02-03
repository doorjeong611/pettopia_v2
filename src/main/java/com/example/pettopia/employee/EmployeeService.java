package com.example.pettopia.employee;

import java.io.File;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		if(employeeForm.getRankNo() == 50) {
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
		
		// empNo
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
			
			
			// 파일 유효성 검사 (이미지 파일만 가능)
			// Spring Boot에서 Multipart 파일의 최대 업로드 크기는 기본적으로 1MB로 설정함. -> 수정하려면 application.yml 에서 설정해야함
			List<String> allowedExtensions = Arrays.asList(".jpg", ".png", ".jpeg");
			if (!allowedExtensions.contains(ext.toLowerCase())) {
			    throw new IllegalArgumentException("이미지 파일만 가능");
			}

			
			EmployeeFile employeeFile = new EmployeeFile();
			employeeFile.setEmpNo(empNo);
			employeeFile.setOriginFileName(orginFileName);
			employeeFile.setFileName(fileName);
			employeeFile.setFileExt(ext);
			employeeFile.setFilePurpose(filePurpose);
			employeeFile.setFileType(empFile.getContentType());
			
			// db insert
			fileResultRow = employeeFileMapper.insertEmployeeFile(employeeFile);
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
			    "<p style='font-size: 16px; line-height: 1.6;'>아래의 버튼을 클릭하여 로그인 후 비밀번호를 변경해주세요.</p>" +
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
	 
	// employeeList : 직원 목록 조회
	public List<Map<String, Object>> getEmployeeList(Map<String, Object> paramMap){
		log.debug(TeamColor.KMJ + "EmployeeService - getEmployeeList() " );
		
		String empNo = (String)paramMap.get("empNo");					 // loginEmp.username 으로 가져온 값
		
		String paramDivisionCode = "";
		String paramEmpStatus = "";
		log.debug(TeamColor.KMJ + "view에서 넘어온 값 divisionCode : " + (String)paramMap.get("divisionCode") );
		log.debug(TeamColor.KMJ + "view에서 넘어온 값 empStatus : " + (String)paramMap.get("empStatus") );
		
		// 선택된 부서
		if(paramMap.get("divisionCode") != null) {
			paramDivisionCode = (String)paramMap.get("divisionCode"); // view에서 넘어온 divisionCode
		}
		log.debug(TeamColor.KMJ + "paramDivisionCode : " + paramDivisionCode );
		
		// 선택된 재직 상태
		if(paramMap.get("empStatus") != null) {
			paramEmpStatus = (String)paramMap.get("empStatus"); // view에서 넘어온 divisionCode
		}
		log.debug(TeamColor.KMJ + "paramEmpStatus : " + paramEmpStatus );
		
		
		// 직원 목록을 조회하려는 사원의 직급 확인 (일반 사원 == 재직 중인 사원만, 인사부 관리자 == 퇴사자 등 모든 사원)
		Map<String, Object> empDivRoleInfo = employeeMapper.selectEmpDivRoleInfo(empNo);
		
		// divisionCode == HR, roleName = ROLE_ADMIN -> isHRAdmin == true
		String divisionCode = (String) empDivRoleInfo.get("divisionCode");   // select로 가져온 부서
		String roleName = (String) empDivRoleInfo.get("roleName");
		
		log.debug(TeamColor.KMJ + "divisionCode : " + divisionCode );
		log.debug(TeamColor.KMJ + "roleName : " + roleName );
		
		boolean isHRAdmin = false;
		
		if(divisionCode.equals("HR") && roleName.equals("ROLE_ADMIN")) {
			isHRAdmin = true;
		}
		
		log.debug(TeamColor.KMJ + "isHRAdmin : " + isHRAdmin );
		
		// 인사부 관리자, view에서 divisionCode 선택 여부, 재직 상태(관리자만 조회 가능)
		Map<String, Object> params = new HashMap<>();
		params.put("isHRAdmin", isHRAdmin);
		params.put("divisionCode", paramDivisionCode);
		params.put("empStatus", paramEmpStatus);
		
		List<Map<String, Object>> empList =  employeeMapper.selectEmployeeList(params);
		if(empList.size() >0) {
			log.debug(TeamColor.KMJ + "empList [0]" + empList.get(0).toString());			
		}else {
			log.debug(TeamColor.KMJ + "조회 결과 없음" );	
		}
		
		
		return empList;
	}
	
	// sendTempPassword : 입력한 사번, 이메일 일치 여부 조회
	public Employee getSimpleEmpInfo(Employee employee) {
		log.debug(TeamColor.KMJ + "EmployeeService - getSimpleEmpInfo() " );
		
		Employee empInfo = employeeMapper.selectSimpleEmpInfo(employee);
		
		if(empInfo != null) {
			log.debug(TeamColor.KMJ + "empInfo - " + empInfo.toString() );
		}
		
		return empInfo;
	}
	
	
	// sendTempPassword - 새로 발급한 임시비밀번호로 db 수정
	public boolean modifyEmployeeTempPw(Employee employee) {
		log.debug(TeamColor.KMJ + "EmployeeService - modifyEmployee() " );
		
		boolean result = false; // update 성공하면 true 
		
		Integer update = employeeMapper.updateEmployee(employee);
		
		if(update == 1) {
			log.debug(TeamColor.KMJ + "update 결과 : " + update );
			result = true;
		}
		
		
		return result; 
	}
	
	
	// sendTempPassword : 임시비밀번호 메일 전송
	public boolean sendMailTempPassword(Employee empInfo ) {
		log.debug(TeamColor.KMJ + "EmployeeService - sendMailTempPassword() " );
		
		String empNo = empInfo.getEmpNo();
		String empName = empInfo.getEmpName();
		String empPw = empInfo.getEmpPw();
		String empEmail = empInfo.getEmpEmail();
		
		
		String subject = "PetTopia Co. 펫토피아 임시 비밀번호 발급 안내";
		String htmlContent = "<html>" +
			    "<body style='font-family: Arial, sans-serif; color: #333;'>" +
			    "<div style='max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f4f4f9; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);'>" +
			    "<h1 style='color: #f15b2a; text-align: center;'>임시 비밀번호 발급 안내입니다, " + empName + "님!</h1>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>안녕하세요, " + empName + "님!</p>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>귀하의 사원 번호는 <b>" + empNo + "</b>입니다.</p>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>임시 비밀번호는 <b>" + empPw + "</b>입니다.</p>" +
			    "<p style='font-size: 16px; line-height: 1.6;'>아래의 버튼을 클릭하여 로그인 후 반드시 비밀번호를 변경해주세요.</p>" +
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
	
	
	// employeeOne : 직원 정보 상세보기
	public Map<String, Object> getEmployeeOne(String empNo){
		log.debug(TeamColor.KMJ + "EmployeeService - getEmployeeOne() " );
		
		log.debug(TeamColor.KMJ + "empNo : " + empNo );
		Map<String , Object> empInfo = employeeMapper.selectEmployeeOne(empNo);
		
		log.debug(TeamColor.KMJ + "empInfo.empName : " + empInfo.get("empName") + TeamColor.RESET );
		
		return empInfo;
		
	}
	
	
	// modifyEmployeeOne : 마이페이지 - 직원 정보 수정
	public boolean modifyEmployeeOne(EmployeeForm empForm, String path, String empFileNo, String empStatus, String isTeamLeader) {
		
		log.debug(TeamColor.KMJ + "EmployeeService - modifyEmployeeOne() " );
		
		// 직원 정보 수정 
		boolean result = false; // 정보 + 프로필 파일 모두 update 성공하면 true 
		
		// employee 테이블 직원 등록
		Employee employee = new Employee();
		employee.setEmpNo(empForm.getEmpNo());
		
		
		log.debug(TeamColor.KMJ + "isTeamLeader : " + isTeamLeader);
		if(isTeamLeader == null || isTeamLeader == "") {
			employee.setIsTeamLeader(null);
		}else {
			employee.setIsTeamLeader(isTeamLeader);
		}
		
		
		log.debug(TeamColor.KMJ + "employeeForm.getEmpNo() : " + empForm.getEmpNo());
		log.debug(TeamColor.KMJ + "employeeForm.getEmpPw() : " + empForm.getEmpPw());
		
		employee.setEmpPw(bCryptPasswordEncoder.encode(empForm.getEmpPw()));
		log.debug(TeamColor.KMJ + "bCryptPasswordEncoder 후 비밀번호 : " + employee.getEmpPw());
		
		// 이름, 이메일, 생년월일, 성별
		employee.setEmpName(empForm.getEmpName());
		employee.setEmpEmail(empForm.getEmpEmail());
		employee.setEmpBirth(empForm.getEmpBirth());
		employee.setEmpGender(empForm.getEmpGender());
		
		// 연락처 
		String empPhone = empForm.getEmpPhoneF()+"-"+empForm.getEmpPhoneM()+"-"+empForm.getEmpPhoneL();
		log.debug(TeamColor.KMJ + "empPhone " + empPhone);
		employee.setEmpPhone(empPhone);
		
		// 주소
		String detailAddress = empForm.getDetailAddress() + "_" +empForm.getDong();
		log.debug(TeamColor.KMJ + "detailAddress : " + detailAddress + TeamColor.RESET);
		employee.setPostalCode(empForm.getPostalCode());
		employee.setBasicAddress(empForm.getBasicAddress());
		employee.setDetailAddress(detailAddress);
		
		// 재직 상태
		if(empStatus.equals("T")) {
			employee.setEmpStatus("E"); // 재직 중
		}
		
		log.debug(TeamColor.KMJ + "수정할 정보 employee : " + employee.toString() + TeamColor.RESET);
		
		
		// 정보 수정
		Integer update = employeeMapper.updateEmployee(employee);
		
		// 정보 수정 성공 -> 프로필 파일 수정 여부 확인 -> 프로필 파일 db 수정 -> 물리적 파일 삭제 -> return true 
		if(update == 1) { // 정보 수정에 성공
			log.debug(TeamColor.KMJ + "update 결과 : " + update );
			
			// 수정할 프로필 파일이 존재하면 수정할 파일로 db 수정 후 /employeeFile에 존재하는 예전 파일(물리적 파일) 지우기
			if(empForm.getEmployeeFile().getSize() > 0) { // 수정할 프로필 파일이 존재하면 
				
				log.debug(TeamColor.KMJ + "프로필 파일 수정 여부 : " + empForm.getEmployeeFile().getSize() + TeamColor.RESET);

				// 프로필 사진 수정
				MultipartFile empFile = empForm.getEmployeeFile();
				
				int dotIndex = empFile.getOriginalFilename().lastIndexOf(".");					// 확장자와 파일명 구분을 위한 . 인덱스 찾기
				String orginFileName = empFile.getOriginalFilename().substring(0, dotIndex);	// 원본파일명
				String fileName = UUID.randomUUID().toString().replace("-", "");				// 랜덤으로 생성한 파일명
				String ext = empFile.getOriginalFilename().substring(dotIndex);					// 확장자 (.jpg)
				String filePurpose = "P";														// 파일 목적 (P : 프로필사진)
				
				log.debug(TeamColor.KMJ + "dotIndex :" + dotIndex);
				log.debug(TeamColor.KMJ + "orginFileName :" + orginFileName);
				log.debug(TeamColor.KMJ + "fileName :" + fileName);
				log.debug(TeamColor.KMJ + "ext :" + ext);
				
				// 파일 유효성 검사 (이미지 파일만 가능)
				// Spring Boot에서 Multipart 파일의 최대 업로드 크기는 기본적으로 1MB로 설정함. -> 수정하려면 application.yml 에서 설정해야함
				List<String> allowedExtensions = Arrays.asList(".jpg", ".png", ".jpeg");
				if (!allowedExtensions.contains(ext.toLowerCase())) {
				    throw new IllegalArgumentException("이미지 파일만 가능");
				}

				EmployeeFile employeeFile = new EmployeeFile();
				// empFileNo 필요
				Integer employeeFileNo = Integer.parseInt(empFileNo);
				employeeFile.setEmpFileNo(employeeFileNo); 										// empFileNo
				employeeFile.setEmpNo(empForm.getEmpNo());
				employeeFile.setOriginFileName(orginFileName);
				employeeFile.setFileName(fileName);
				employeeFile.setFileExt(ext);
				employeeFile.setFilePurpose(filePurpose);
				employeeFile.setFileType(empFile.getContentType());
				
				// db 수정 전 물리적으로 삭제할 파일 이름 가져오기
				EmployeeFile empFileInfo = employeeFileMapper.selectEmployeeFile(employeeFileNo);
				String deleteFileName = empFileInfo.getFileName() + empFileInfo.getFileExt();
				
				log.debug(TeamColor.KMJ + "deleteFileName :" + deleteFileName);
				
				// db 수정
				int updateEmpFile = employeeFileMapper.updateEmployeeFile(employeeFile);
				
				// db 수정에 성공하면 새로운 파일 저장 + 물리적 파일 삭제
				if(updateEmpFile == 1) {
					
					// 새로운 물리적 파일 저장하기
					try {
						empFile.transferTo(new File(path + fileName + ext)); // /employeeFile/manggom5(UUID로 변환).jpg
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException();
					}
					
					
					File f = new File(path, deleteFileName); 	// 해당 path에 deleteFileName의 파일 가져옴
					if(f.exists()) {						 	// 파일이 존재한다면
						boolean deleteFileResult = f.delete();	// 파일 삭제
						
						if(deleteFileResult == false) {			// 파일 삭제에 실패한다면  예외 발생시키기
							throw new RuntimeException("파일 삭제에 실패했습니다: " + deleteFileName); // 물리적 파일 삭제는 @transactional이 관리하지 않으므로 실패시 RuntimeException을 만들어줌	
						
						}
	
					}

				}

				
			}else {
				log.debug(TeamColor.KMJ + "getEmployeeFile().getSize() : " +empForm.getEmployeeFile().getSize() + TeamColor.RESET);
				log.debug(TeamColor.KMJ + "첨부 파일 없음" + TeamColor.RESET);
			}

			// 1. 직원 정보 수정(db) + 프로필 파일 수정(db) + 물리적 파일 삭제 모두 성공 
			// 2. 직원 정보 수정(db) + (수정할 프로필 파일 없음)
			result = true;
		}
		
		log.debug(TeamColor.KMJ + "최종 result :" + result + TeamColor.KMJ);
		return result; 
		
	}
	

	// employeeSummary : 직원 공식 정보 상세보기
	public Map<String, Object> getEmployeeSummary(String empNo){
		log.debug(TeamColor.KMJ + "EmployeeService - getEmployeeSummary() " );
		log.debug(TeamColor.KMJ + "empNo:" + empNo + TeamColor.KMJ);
		
		Map<String, Object> empInfo = employeeMapper.selectEmployeeSummary(empNo);
		log.debug(TeamColor.KMJ + "empInfo : " + empInfo + TeamColor.RESET);
		
		return empInfo;
	}
	
	
	// modifyEmployeeSummary : 직원 부서, 직급, 재직상태 수정
	public boolean modifyEmployeeSummary(Employee employee) {
		
		log.debug(TeamColor.KMJ + "EmployeeService - getEmployeeSummary() " );
		log.debug(TeamColor.KMJ + "empNo:" + employee.getEmpNo() + TeamColor.KMJ);
		log.debug(TeamColor.WJ + "확인" + TeamColor.KMJ);
		
		boolean result = false; // 수정 성공시 true
	
		if(employee.getRankNo() != null) { 
			if(employee.getRankNo() == 50) { // 직급이 50일 경우 팀장 'H'
				employee.setIsTeamLeader("H");
			}else {
				employee.setIsTeamLeader("");
			}
			
		}
		if(employee.getEmpStatus() != null && employee.getEmpStatus().equals("R")) {
			employee.setResignationDate("123");
		}
		
		
		log.debug(TeamColor.KMJ + "수정 할 employee:" + employee.toString() + TeamColor.KMJ);
		
		Integer row = employeeMapper.updateEmployee(employee);
		
		if(row == 1) {
			result = true;
		}
		
		log.debug(TeamColor.KMJ + "row : " + row + TeamColor.KMJ);
		log.debug(TeamColor.KMJ + "result" + result + TeamColor.KMJ);
		
		
		return result;
		
	}
	
	

	
	

}// employeeService
