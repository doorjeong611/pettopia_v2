package com.example.pettopia.employeefile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.EmployeeFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class EmployeeFileService {
	
	@Autowired EmployeeFileMapper employeeFileMapper;
	
	// employeeOne : employeeFileRest- getEmployeeSignFile() : 등록된 서명 가져오기.
	public EmployeeFile getEmployeeSignFile(String empNo) {
		
		log.debug(TeamColor.KMJ+" EmployeeFileService : getEmployeeSignFile()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empNo : " + empNo + TeamColor.RESET);
		
		EmployeeFile empSignFile = new EmployeeFile();
		
		empSignFile = employeeFileMapper.selectEmployeeSignFile(empNo);
		
		if(empSignFile != null) {
			log.debug(TeamColor.KMJ+" empNo : " + empSignFile.toString() + TeamColor.RESET);
		}
			log.debug(TeamColor.KMJ+" 서명 없음 "  + TeamColor.RESET);

		return empSignFile;
	}
	
	
	
	// employeeOne : 서명 등록 - signature_pad (이미 존재하는 서명은 삭제 -> 새로운 서명 등록)
	public int addEmpSignFileSignPad(String sign, String path, String empNo) {
		log.debug(TeamColor.KMJ+" EmployeeFileService : addEmpSignFileSignPad()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" path : "+ path + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empNo : "+ empNo + TeamColor.RESET);
		if(sign != null) {
			log.debug(TeamColor.KMJ+" sign - null 아님  "+ sign.toString() + TeamColor.RESET);
		}
		
		// 해당 사번의 서명이 db에서 존재하는지 확인 -> 물리적 파일 삭제를 위해 이름이 필요함.
		EmployeeFile nowEmpSignFile = employeeFileMapper.selectEmployeeSignFile(empNo);
		
		if(nowEmpSignFile != null) { // 이미 등록한 sign이 존재한다면 삭제 후 등록
			int deleteRow = 0;
			deleteRow = employeeFileMapper.deleteEmployeeSignFile(empNo);
			String deleteFileName = nowEmpSignFile.getFileName() + nowEmpSignFile.getFileExt();
			
			log.debug(TeamColor.KMJ + "deleteFileName :" + deleteFileName);
			
			if(deleteRow != 0) {						    // db에서 삭제에 성공하면 물리적 파일도 삭제해야함
				
				File f = new File(path, deleteFileName); 	// 해당 path에 deleteFileName의 파일 가져옴
				if(f.exists()) {						 	// 파일이 존재한다면
					boolean deleteFileResult = f.delete();	// 파일 삭제
					
					if(deleteFileResult == false) {			// 파일 삭제에 실패한다면  예외 발생시키기
						throw new RuntimeException("파일 삭제에 실패했습니다: " + deleteFileName); // 물리적 파일 삭제는 @transactional이 관리하지 않으므로 실패시 RuntimeException을 만들어줌	
					
					}

				}
	
			}
			
		} // 이미 등록한 파일 삭제 if
		
		// 삭제 후 or 처음으로 새로운 서명 물리적 저장 + db 등록 
		int row = 0;
		
		// sign 문자중 이미지에 해당하는 문자만 분리 후 이미지로 변환
		String fileName = UUID.randomUUID().toString().replace("-", "");
		String ext = ".png";
		FileOutputStream fos = null;
		
		
		try {
			// 물리적 저장
			fos = new FileOutputStream(path + fileName + ext);
			// sign은 Base64 형식으로 인코딩된 데이터 URL 형태의 문자열임.
			// sign.split(",")[1]은 Base64 데이터 부분만 추출힉;
			// Base64.getDecoder().decode()를 사용하여 Base64 데이터를 디코딩하여 바이너리 형태로 변환
			// fos.write()는 디코딩된 바이너리 데이터를 해당 파일 쓰기 -> 물리적 저장하기
			fos.write(Base64.getDecoder().decode(sign.split(",")[1]));
			
			// db에 파일 저장
			EmployeeFile empFile = new EmployeeFile();
			empFile.setFileName(fileName);					// 파일 이름
			empFile.setFileExt(ext);						// 파일 확장자
			empFile.setOriginFileName(fileName);			// 원본 파일 이름 = 파일 이름 (signature_pad 는 서명을 가져와서 이미지로 변환하기 때문)
			empFile.setEmpNo(empNo);						// 사번
			empFile.setFileType("image/png");				// 파일 타입
			empFile.setFilePurpose("S");					// 파일 용도
			
			row = employeeFileMapper.insertEmployeeFile(empFile);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// 트랜잭션 처리를 위해 runtimeException 발생
			throw new RuntimeException(); // try~catch를 강요하지 않는 예외 발생
		}finally {
			try {
				fos.close();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	
		return row;
	}
	
	// employeeOne : 서명 등록 - sign 이미지 (이미 존재하는 서명은 삭제 -> 새로운 서명 등록) 
	public int addEmpSignFileSignImage(MultipartFile employeeFile, String path, String empNo) {
		
		log.debug(TeamColor.KMJ+" EmployeeFileService : addEmpSignFileSignImage()" + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" path : "+ path + TeamColor.RESET);
		log.debug(TeamColor.KMJ+" empNo : "+ empNo + TeamColor.RESET);
		
		if(employeeFile.getSize() > 0) {
			log.debug(TeamColor.KMJ+" employeeFile : "+ employeeFile + TeamColor.RESET);
		}
		
		// 해당 사번의 서명이 db에서 존재하는지 확인 -> 물리적 파일 삭제를 위해 이름이 필요함.
		EmployeeFile nowEmpSignFile = employeeFileMapper.selectEmployeeSignFile(empNo);
		
		if(nowEmpSignFile != null) { // 이미 등록한 sign이 존재한다면 삭제 후 등록
			int deleteRow = 0;
			
			// 삭제
			deleteRow = employeeFileMapper.deleteEmployeeSignFile(empNo);
			String deleteFileName = nowEmpSignFile.getFileName() + nowEmpSignFile.getFileExt();
			
			log.debug(TeamColor.KMJ + "deleteFileName :" + deleteFileName);
			
			if(deleteRow != 0) {						    // db에서 삭제에 성공하면 물리적 파일도 삭제해야함
				
				File f = new File(path, deleteFileName); 	// 해당 path에 deleteFileName의 파일 가져옴
				if(f.exists()) {						 	// 파일이 존재한다면
					boolean deleteFileResult = f.delete();	// 파일 삭제
					
					if(deleteFileResult == false) {			// 파일 삭제에 실패한다면  예외 발생시키기
						throw new RuntimeException("파일 삭제에 실패했습니다: " + deleteFileName); // 물리적 파일 삭제는 @transactional이 관리하지 않으므로 실패시 RuntimeException을 만들어줌	
					
					}

				}
	
			}
			
		} // 이미 등록한 파일 삭제 if
				
		
		// 삭제 후 or 처음으로 새로운 서명 물리적 저장 + db 등록 
		int row = 0;
		

		int dotIndex = employeeFile.getOriginalFilename().lastIndexOf(".");					// 확장자와 파일명 구분을 위한 . 인덱스 찾기
		String orginFileName = employeeFile.getOriginalFilename().substring(0, dotIndex);	// 원본파일명
		String fileName = UUID.randomUUID().toString().replace("-", "");					// 랜덤으로 생성한 파일명
		String ext = employeeFile.getOriginalFilename().substring(dotIndex);						// 확장자 (.jpg)
		String filePurpose = "S";															// 파일 목적 (S : 서명)
				
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
		
		EmployeeFile empFile = new EmployeeFile();
		empFile.setEmpNo(empNo);
		empFile.setFileName(fileName);
		empFile.setOriginFileName(orginFileName);
		empFile.setFileExt(ext);
		empFile.setFilePurpose(filePurpose);
		empFile.setFileType(employeeFile.getContentType());
		
		// db 입력
		row = employeeFileMapper.insertEmployeeFile(empFile);
		
		return row;
	}
	
	
	

}
