package com.example.pettopia.employee;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Employee;
import com.example.pettopia.vo.EmployeeForm;


import jakarta.servlet.http.HttpSession;


@Controller
@Slf4j
public class EmployeeController {
	
	@Autowired EmployeeService employeeService;


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
	public String employeeList(Model model) {
		
		log.debug(TeamColor.KMJ+"[EmployeeController - Get employeeList()]");
		
		// 직원 목록 가져오기
		List<Map<String, Object>> empList = employeeService.getEmployeeList();
		log.debug(TeamColor.KMJ + "empList [0]" + empList.get(0).toString());
		
		model.addAttribute("empList", empList);
		
		return "employee/employeeList";
	}
	

	
	// 임시 비밀번호 발급 : (비밀번호 찾기)
	@GetMapping("/sendTempPassword")
	public String sendTempPassword() {
		log.debug(TeamColor.KMJ+" LoginController : GET sendTempPassword()" + TeamColor.RESET);
		
		return "common/sendTempPassword";
	}
	
	@PostMapping("/sendTempPassword")
	public String sendTempPassword(@RequestParam String empNo, @RequestParam String empEmail) {
		log.debug(TeamColor.KMJ+" LoginController : POST sendTempPassword()" + TeamColor.RESET);
		
		// 입력된 사번과 이메일이 db 정보와 일치여부 확인
		log.debug(TeamColor.KMJ+"empNo -  "+ empNo + TeamColor.RESET);
		log.debug(TeamColor.KMJ+"empEmail -  " + empEmail + TeamColor.RESET);
		
		Employee employee = new Employee();
		employee.setEmpNo(empNo);
		employee.setEmpEmail(empEmail);
		
		Employee empInfo = new Employee();
		empInfo = employeeService.getSimpleEmpInfo(employee);
		
		// 사번과 이메일이 db와 일치한다면 임시비밀번호로 db 수정, 성공시 메일 보내기
		if(empInfo != null) {												// db와 일치하면 
			log.debug(TeamColor.KMJ + "empInfo - " + empInfo.toString() );
			
			// 임시 비밀번호 발급 : [uuid + !] -> 총 8자리
			String tempPw = UUID.randomUUID().toString().replace("-", "").substring(0, 7)+"!";
			log.debug(TeamColor.KMJ + "임시 비밀번호 발급 : " + tempPw);
			
			// 발급받은 임시 비밀번호로 db 수정 
			boolean result = employeeService.modifyEmployee(employee);
			
			
		}
		
		
		
		
		
		return "redirect:/loginForm";
	}
	
	
	
	
	
	
	
	
	

}
