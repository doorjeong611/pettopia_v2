package com.example.pettopia.employee;


import java.net.URLEncoder;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeForm;


import jakarta.servlet.http.HttpSession;


@Controller
@Slf4j
public class EmployeeController {
	
	@Autowired EmployeeService employeeService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
	
	// 직원 등록
	@GetMapping("/admin/addEmployee")
	public String addEmployee( Model model) {
		log.debug(TeamColor.KMJ+"[EmployeeController - GET addEmployee()]");
		
		// 사번 자동 입력 
		// 규칙 : 입사년도 + 00001부터 1씩 증가.  -> 입사년도가 바뀌면 다시 00001부터 시작
		
		// 올해 년도 
		LocalDateTime now = LocalDateTime.now();
		log.debug(TeamColor.KMJ+"오늘 : " + now);
		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy");
		String nowYear = now.format(format);
		log.debug(TeamColor.KMJ+"올해 : " + nowYear);
		
		// 마지막으로 입력된 사원 번호 가져오기
		String latestEmpNo = employeeService.getLatestEmpNo();
		log.debug(TeamColor.KMJ+"latestEmpNo : " + latestEmpNo);
		
		// 입사년도가 바뀌면 다시 00001부터 시작하기 위해 년도 비교하기
		String latestEmpNoYear = latestEmpNo.substring( 0, 4);
		log.debug(TeamColor.KMJ+"latestEmpNoYear : " + latestEmpNoYear);
		
		String inputEmpNo = "";
		if(!nowYear.equals(latestEmpNoYear)) {										// 해가 바뀌면 00001부터 시작
			
			inputEmpNo = nowYear + "00001";
			log.debug(TeamColor.KMJ + "새해 시작 사번 : ", inputEmpNo);
			
			model.addAttribute("inputEmpNo", inputEmpNo);
			
		}else {																		// 동일한 연도라면 최근 입사한 empNo+1
			
			int latestEmpNoPlus = Integer.parseInt(latestEmpNo)+1;
			log.debug(TeamColor.KMJ + "같은 해 최근 입사 사번 + 1 : " + latestEmpNoPlus + TeamColor.RESET);
			
			inputEmpNo = "" + latestEmpNoPlus;
			model.addAttribute("inputEmpNo", inputEmpNo);
		}
		
		
		
		return "common/addEmployee";
	}
	
	
	// 직원 등록 
	@PostMapping("/admin/addEmployee")
	public String addEmployee(EmployeeForm employeeForm,  HttpSession session) {
		
		log.debug(TeamColor.KMJ+"[EmployeeController - POST addEmployee()]");
		log.debug(TeamColor.KMJ + "employeeForm :  " + employeeForm.toString());
	
		String path = session.getServletContext().getRealPath("/employeeFile/");

		// 임시 비밀번호 설정 (uuid + !) -> 총 8자리
		String tempPw = UUID.randomUUID().toString().replace("-", "").substring(0, 7)+"!";
		log.debug(TeamColor.KMJ + "--- 임시 비밀번호 설정 --- " + tempPw);
				
		employeeForm.setEmpPw(tempPw);
		
		log.debug(TeamColor.KMJ + "비밀번호 추가 후 employeeForm :  " + employeeForm.toString());
		

		// 등록 
		boolean addResult = employeeService.addEmployee(employeeForm, path);
		
		// 등록에 성공하면 메일 보내기
		if(addResult) { // 등록 성공 = true
			// 이메일 전송에 필요한 정보 : 사번, 이름, 임시비밀번호, 이메일
			Employee employee = new Employee();
			employee.setEmpNo(employeeForm.getEmpNo());
			employee.setEmpPw(tempPw);
			employee.setEmpName(employeeForm.getEmpName());
			employee.setEmpEmail(employeeForm.getEmpEmail());
			
			boolean sendMailResult = employeeService.sendMailEmployeeInfo(employee);
			
			if(sendMailResult == false) {// 메일 전송 실패시 
				log.debug(TeamColor.KMJ + "실패 ! 직원 리스트로 이동");
				log.debug(TeamColor.KMJ + "sendMailResult" + sendMailResult);
				return "employee/employeeList";
			}
			
			
		}

		
		return "redirect:/employeeList";
	}
	

	// 메일로 보낼 비밀번호 변경 경로 -> 시큐리티 적용으로 바로 로그인으로 연결되므로 변경하기
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam String empNo, @RequestParam String empPw, Model model) {
		
		model.addAttribute("empNo", empNo);
		model.addAttribute("empPw", empPw);
		
		return "common/changePassword";
	}
	
	// 직원 목록
	@GetMapping("/employeeList")
	public String employeeList(Model model, Authentication auth) {
		log.debug(TeamColor.KMJ+"[EmployeeController - Get employeeList()]");
		
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String diviCode = empUserDetails.getDeptCode().substring(0, 2); // divisionCode
		String roleName = empUserDetails.getRoleName();
		
		log.debug(TeamColor.KMJ+"diviCode -  "+ diviCode + TeamColor.RESET);
		log.debug(TeamColor.KMJ+"roleName -  "+ roleName + TeamColor.RESET);
		
		boolean isAllowedEmpStatus = false; // 인사부 관리자가 아니면 
		if(diviCode.equals("HR") && roleName.equals("ROLE_ADMIN")) {
			isAllowedEmpStatus = true;
		}
		
		log.debug(TeamColor.KMJ+"isAllowedEmpStatus -  "+ isAllowedEmpStatus + TeamColor.RESET);
		
		model.addAttribute("isAllowedEmpStatus", isAllowedEmpStatus);
		
		
		return "employee/employeeList";
	}
	

	
	// 임시 비밀번호 발급 : (비밀번호 찾기) 폼
	@GetMapping("/sendTempPassword")
	public String sendTempPassword() {
		log.debug(TeamColor.KMJ+" EmployeeController : GET sendTempPassword()" + TeamColor.RESET);
		
		return "common/sendTempPassword";
	}
	
	// 임시 비밀번호 발급 : (비밀번호 찾기)
	@PostMapping("/sendTempPassword")
	public String sendTempPassword(@RequestParam String empNo, @RequestParam String empEmail, RedirectAttributes redirectAttributes , Model model) {
		log.debug(TeamColor.KMJ+" EmployeeController : POST sendTempPassword()" + TeamColor.RESET);
		
		// 입력된 사번과 이메일이 db 정보와 일치여부 확인
		log.debug(TeamColor.KMJ+"empNo -  "+ empNo + TeamColor.RESET);
		log.debug(TeamColor.KMJ+"empEmail -  " + empEmail + TeamColor.RESET);
		
		Employee employee = new Employee();
		employee.setEmpNo(empNo);
		employee.setEmpEmail(empEmail);
		
		Employee empInfo = new Employee();
		empInfo = employeeService.getSimpleEmpInfo(employee); // 일치한다면 사번, 이름, 이메일, 팀장여부 가져옴
		
		String msg = "임시 비밀번호 발급 성공!";

		
		// 사번과 이메일이 db와 일치한다면 임시비밀번호로 db 수정, 성공시 메일 보내기
		if(empInfo != null) {												// db와 일치하면 
			log.debug(TeamColor.KMJ + "empInfo - " + empInfo.toString() );
			
			// 임시 비밀번호 발급 : [uuid + !] -> 총 8자리
			String tempPw = UUID.randomUUID().toString().replace("-", "").substring(0, 7)+"!";
			log.debug(TeamColor.KMJ + "임시 비밀번호 발급 : " + tempPw);
			
			employee.setEmpPw(bCryptPasswordEncoder.encode(tempPw));
			employee.setIsTeamLeader(empInfo.getIsTeamLeader());
			
			// 발급받은 임시 비밀번호로 db 수정 
			boolean result = employeeService.modifyEmployeeTempPw(employee); // update 성공하면 true 
			log.debug(TeamColor.KMJ + "임시비밀번호 db 수정 : " + result);
			
			if(result == false) { // update 실패
				log.debug(TeamColor.KMJ + "임시비밀번호 db 수정 : " + result);
				msg = "임시 비밀번호 발급 실패! 인사팀으로 연락주세요";
				log.debug(TeamColor.KMJ + "msg : " + msg);
				
				redirectAttributes.addFlashAttribute("msg", msg);
				
				return "redirect:/sendTempPassword";
			}
			
			// update 성공
			// 발급한 임시비밀번호 메일로 전송 (사번, 이름, 이메일, 임시비밀번호)
			empInfo.setEmpPw(tempPw);
			boolean sendMailResult = employeeService.sendMailTempPassword(empInfo);
			
			if(sendMailResult == false) {// 메일 전송 실패시 
				log.debug(TeamColor.KMJ + "실패 ! 로그인 폼으로 이동");
				log.debug(TeamColor.KMJ + "sendMailResult" + sendMailResult);
				
				msg = "임시 비밀번호 발급 실패! 인사팀으로 연락주세요";
				log.debug(TeamColor.KMJ + "msg : " + msg);
				
				redirectAttributes.addFlashAttribute("msg", msg);
				
				return "redirect:/sendTempPassword";
			}
			
			// 메일 전송 성공시
			String tempmsg = "임시 비밀번호 발급 성공! 메일을 확인해주세요";
			log.debug(TeamColor.KMJ + "tempmsg : " + tempmsg);
			model.addAttribute("tempmsg", tempmsg);
			
			return "login/login";
			
		}
		
		// 직원 정보 불일치 
		msg = "임시 비밀번호 발급 실패! 인사팀으로 연락주세요";
		log.debug(TeamColor.KMJ + "msg : " + msg);
		
		redirectAttributes.addFlashAttribute("msg", msg);
		
		return "redirect:/sendTempPassword";
	}
	
	
	// 직원 상세보기 : 마이페이지
	@GetMapping("/employee/employeeOne")
	public String getEmployeeOne(@RequestParam String empNo, Model model) {
		log.debug(TeamColor.KMJ+" EmployeeController : POST employeeOne()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empNo : "+ empNo + TeamColor.RESET);
		
		// 직원 개인 정보 
		Map<String, Object> empInfo = employeeService.getEmployeeOne(empNo);
		log.debug(TeamColor.KMJ+" empInfo : "+ empInfo.toString() + TeamColor.RESET);
		
		
		model.addAttribute("empInfo", empInfo);
		
		return "employee/employeeOne";
	}
	
	
	// 직원 정보 수정
	@GetMapping("/employee/modifyEmployeeOne")
	public String modifyEmployeeOne(@RequestParam String empNo, Model model) {
		log.debug(TeamColor.KMJ+" EmployeeController : GET modifyEmployeeOne()" + TeamColor.RESET);
		
		log.debug(TeamColor.KMJ+" empNo : "+ empNo + TeamColor.RESET);
		
		Map<String, Object> empInfo = employeeService.getEmployeeOne(empNo);
		log.debug(TeamColor.KMJ+" empInfo : "+ empInfo.toString() + TeamColor.RESET);
		
		// 수정 페이지에 맞춰서 employeeForm에 담아주기.
		EmployeeForm empForm = new EmployeeForm();
		
		empForm.setEmpName((String)empInfo.get("empName"));				// 이름
		
		// mysql date타입 -> String으로 변환 = java.sql.Date 사용
		Date date = (Date)empInfo.get("empBirth");
		String birth = date.toString(); 
		empForm.setEmpBirth(birth);										// 생년월일
		
		empForm.setEmpEmail((String)empInfo.get("empEmail"));			// 이메일
		
		// 연락처 숫자만 필요하므로 '-' 제외
		String empPhone = (String) empInfo.get("empPhone");
		String empPhoneF = empPhone.substring(0, 3); // 010
		String empPhoneM = empPhone.substring(4, 8); // 1234
		String empPhoneL = empPhone.substring(9);	 // 5678
		
		empForm.setEmpPhoneF(empPhoneF);								// 연락처
		empForm.setEmpPhoneM(empPhoneM);
		empForm.setEmpPhoneL(empPhoneL);
		
		// 성별 : 남자, 여자 -> M, F 변환하기
		if(((String) empInfo.get("empGender")).equals("여자")) {
			empForm.setEmpGender("F");									// 성별
		}else {
			empForm.setEmpGender("M");			
		}
		
		// 주소
		empForm.setPostalCode((String)empInfo.get("postalCode")); 		// 우편번호
		empForm.setBasicAddress((String) empInfo.get("basicAddress")); 	// 기본주소
		
		String detailAddr = (String) empInfo.get("detailAddress");
		int dongIndex = detailAddr.indexOf("_");
		String detailAddress = detailAddr.substring(0, dongIndex); 
		String dong = detailAddr.substring(dongIndex+1);
		
		empForm.setDetailAddress(detailAddress);						// 상세주소
		empForm.setDong(dong);											// 동
		
		// 프로필 사진
		Integer empFileNo = (Integer)empInfo.get("empFileNo"); 			// 수정을 위한 empFileNo
		String fileName = (String)empInfo.get("empFileName");			// 프로필 파일
		
		// 직원 상태 = 임시 직원 'T' -> 'E' 로 변경해야하므로 조회 후 가져오기
		String empStatus = (String) empInfo.get("empStatus");
		
		model.addAttribute("empStatus", empStatus);
		model.addAttribute("fileName", fileName);
		model.addAttribute("empFileNo", empFileNo);
		model.addAttribute("empForm", empForm);
		model.addAttribute("isTeamLeader", empInfo.get("isTeamLeader"));
		
		return "employee/modifyEmployeeOne";
	}
	
	// modifyEmployeeOne : 직원 개인 정보 수정
	@PostMapping("/employee/modifyEmployeeOne")
	public String modifyEmployeeOne(EmployeeForm employeeForm, @RequestParam String empFileNo, @RequestParam String empStatus, @RequestParam String isTeamLeader,  HttpSession session) {
		log.debug(TeamColor.KMJ+" EmployeeController : POST modifyEmployeeOne()" + TeamColor.RESET);
		
		log.debug(TeamColor.KMJ+" empFileNo : "+ empFileNo + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empStatus : "+ empStatus + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" isTeamLeader : "+ isTeamLeader + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" employeeForm : "+ employeeForm.toString() + TeamColor.RESET);
		
		String path = session.getServletContext().getRealPath("/employeeFile/");
		
		// 직원 정보 수정
		boolean result = employeeService.modifyEmployeeOne(employeeForm, path, empFileNo, empStatus, isTeamLeader);
		
		
		
		return "common/petTopiaMain";
	}
	
	
	// employeeSummary : 직원 부서정보 
	@GetMapping("/employee/employeeSummary")
	public String getEmployeeSummary(@RequestParam String empNo, Model model, Authentication auth) {
		log.debug(TeamColor.KMJ+" EmployeeController : GET getEmployeeSummary()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empNo : "+ empNo + TeamColor.RESET);
		
		// 로그인 한 직원 권한 확인 (인사부 관리자)
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String loginEmpRoleName = empUserDetails.getRoleName();
		String loginEmpDeptCode = empUserDetails.getDeptCode().substring(0, 2);
		Integer loginEmpRankNo = empUserDetails.getRankNo();
		
		boolean isAdmin = false; // 인사부 관리자라면 true
		
		if(loginEmpDeptCode.equals("HR") && loginEmpRoleName.equals("ROLE_ADMIN")) {
			isAdmin = true;
			
		}else if(loginEmpRankNo == 70) {
			isAdmin = true;
			
		}
		log.debug(TeamColor.KMJ+" isAdmin : "+ isAdmin + TeamColor.RESET);
		model.addAttribute("isAdmin", isAdmin);
		
		// 직원 공식 정보 
		Map<String, Object> empInfo = employeeService.getEmployeeSummary(empNo);	
		
		log.debug(TeamColor.KMJ+" empInfo : "+ empInfo.toString() + TeamColor.RESET);
		model.addAttribute("empInfo", empInfo);
		
		return "employee/employeeSummary";
		
		
	}
	
	
	// employeeSummary : 직원 부서, 직급, 재직 상태 수정
	@PostMapping("/employee/modifyEmployeSummary")
	public String modifyEmployeSummary(@RequestParam(required = false) String empDeptCode, @RequestParam(required = false) String empRankNo, @RequestParam(required = false) String empStatusVal, @RequestParam String sendEmpNo ) {
		
		log.debug(TeamColor.KMJ+" EmployeeController : POST modifyEmployeSummary()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" sendEmpNo : "+ sendEmpNo + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empDeptCode : "+ empDeptCode + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empRankNo : "+ empRankNo + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empStatusVal : "+ empStatusVal + TeamColor.RESET);
		
		// 직원 부서, 직급(팀장여부), 재직 상태 정보 수정
		Employee employee = new Employee();
		
		employee.setEmpNo(sendEmpNo);
		
		
		if(empDeptCode != null && empDeptCode != "null") {
			employee.setDeptCode(empDeptCode);
		}
		
		if(empRankNo != null && empRankNo != "null") {
			Integer rankNo = Integer.parseInt(empRankNo);
			employee.setRankNo(rankNo);
		}
		
		if(empStatusVal != null && empStatusVal != "null") {
			employee.setEmpStatus(empStatusVal);
		}
		
		boolean result = employeeService.modifyEmployeeSummary(employee);
		
		log.debug(TeamColor.KMJ+" result : "+ result + TeamColor.RESET);
		
		
		return "redirect:/employee/employeeSummary?empNo="+sendEmpNo;
	}
	
	
	
	
	
	
	

}
