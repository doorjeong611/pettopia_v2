package com.example.pettopia.employeefile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	// employeeOne : 서명 등록 (이미 존재하는 서명은 삭제 -> 새로운 서명 등록)
	public int addEmpSignFile(String sign, String path) {
		log.debug(TeamColor.KMJ+" EmployeeFileService : addEmpSignFile()" + TeamColor.RESET);
		
		if(sign != null) {
			log.debug(TeamColor.KMJ+" sign - null 아님  "+ sign.toString() + TeamColor.RESET);
		}
		
		int row = 0;
		
		// sign 문자중 이미지에 해당하는 문자만 분리 후 이미지로 변환
		String fileName = UUID.randomUUID().toString().replace("-", "");
		FileOutputStream fos = null;
		
		
		try {
			fos = new FileOutputStream(path + fileName + ".png");
			fos.write(Base64.getDecoder().decode(sign.split(",")[1]));
			
			// mapper 호출
//			Doc doc = new Doc();
//			doc.setDocNo(docNo);
//			doc.setDocSign(fileName + ".png");
			
//			row = docMapper.insertDoc(doc);
			
			
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
	
	

}
