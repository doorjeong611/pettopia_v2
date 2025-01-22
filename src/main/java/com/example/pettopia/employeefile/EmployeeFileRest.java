package com.example.pettopia.employeefile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.dto.EmpUserDetails;
import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.EmployeeFile;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class EmployeeFileRest {
	
	@Autowired EmployeeFileService employeeFileService;
	
	// employeeOne : 서명 관리 모달 클릭하면 존재하는 서명 미리보기 + 서명 첨부 버튼 + signature_pad 추가 버튼 
	@GetMapping("/rest/employeeSignFile")
	public EmployeeFile getEmployeeSignFile(Authentication auth, Model model) {
		
		log.debug(TeamColor.KMJ+" EmployeeFileRest : GET getEmployeeSignFile()" + TeamColor.RESET);
		
		// 로그인세션에서 사번 가져오기
		EmpUserDetails empUserDetails = (EmpUserDetails) auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		log.debug(TeamColor.KMJ+" empNo : " + empNo + TeamColor.RESET);
		
		// empNo를 이용하여 db에서 서명 가져오기.
		EmployeeFile empFile = employeeFileService.getEmployeeSignFile(empNo);
		
		if(empFile != null) {
			log.debug(TeamColor.KMJ+" empFile : " + empFile.toString() + TeamColor.RESET);			
		}
		
		return empFile;
	}
	
	// employeeOne : 서명 등록 (이미 존재하는 서명은 삭제 -> 새로운 서명 등록)
	@PostMapping("/rest/addEmployeeSignFile")
	public ResponseEntity<String> addEmployeeSignFile(HttpSession session, @RequestParam(required = false) String sign, @RequestParam(required = false) MultipartFile empSignFile, Authentication auth) {
		log.debug(TeamColor.KMJ+" EmployeeFileRest : Post addEmployeeSignFile()" + TeamColor.RESET);
		
		String path = session.getServletContext().getRealPath("/employeeFile/");
		EmpUserDetails empUserDetails = (EmpUserDetails)auth.getPrincipal();
		String empNo = empUserDetails.getUsername();
		
		log.debug(TeamColor.KMJ+" empNo : " + empNo + TeamColor.RESET);
		
		int row = 0;
		
		// 넘어온 값이 signPad인지 확인
		if(sign != null) {
			log.debug(TeamColor.KMJ+" sign : " + sign + TeamColor.RESET);
			log.debug(TeamColor.KMJ+" sign " + TeamColor.RESET);
			
//			row = employeeFileService.addEmpSignFileSignPad(sign, path, empNo);
			
			
		}
		// 넘어온 값이 첨부파일인지 확인
		if(empSignFile != null && !empSignFile.isEmpty()){
			log.debug(TeamColor.KMJ+" empSignFile : " + empSignFile + TeamColor.RESET);
			log.debug(TeamColor.KMJ+" 첨부 파일 : " +TeamColor.RESET);
			
//			row = employeeFileService.addEmpSignFileSignImage(empSignFile, path, empNo);
			
		}
		
		
		
		
		
		return  ResponseEntity.ok("등록 성공");
	}
	
	
	
	
	

}
