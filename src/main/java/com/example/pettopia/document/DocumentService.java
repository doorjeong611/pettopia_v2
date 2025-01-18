package com.example.pettopia.document;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Document;
import com.example.pettopia.vo.DocumentApprovers;

import lombok.extern.slf4j.Slf4j;


@Service
@Transactional
@Slf4j
public class DocumentService {
	
	@Autowired DocumentMapper documentMapper;
	
	// addDocument → 문서 작성
	public Integer addDocument(Document document, DocumentApprovers documentApprovers) {
		documentMapper.insertDocument(document);
		
		documentApprovers.setDocNo(document.getDocNo());
		log.debug(TeamColor.KDH + "DocNo : " + document.getDocNo() + TeamColor.RESET);
		
		documentMapper.insertDocumentApprovers(documentApprovers);
		return 1;
	}
	
	// addDocument → 문서 작성할 때 작성자 직원 부서 조회
	public Map<String, Object> getEmployeeDept(String empNo) {
		return documentMapper.selectEmployeeDept(empNo);
	}
	
	// addDocument → 결재자 지정할 때 상위 부서 조회
	public List<Division> getDivisionListByDocument(){
		return documentMapper.selectDivisionListByDocument();
	}
	
	// addDocument → 결재자 지정할 때 팀 조회
	public List<Department> getDeptListByDocument(String divisionCode) {
		return documentMapper.selectDeptListByDocument(divisionCode);
	}
	
	// addDocument → 결재자 지정할 때 직원 조회
	public List<Map<String, Object>> getEmpListByDocument(String deptCode) {
		return documentMapper.selectEmpListByDocument(deptCode);
	}
	
	// addDocument → 결재자 지정할 때 직원 검색
	public List<Map<String, Object>> getEmpSearchByDocument(String empName) {
		return documentMapper.selectEmpSearchByDocument(empName);
	}
	
	// documentList → 결재 문서 리스트 조회
	public List<Map<String, Object>> getDocumnetList(String empNo, String docWriterNo, String initApproverNo, String approvalStatus) {
		return documentMapper.selectDocumentList(empNo, docWriterNo, initApproverNo, approvalStatus);
	}
	
	
	
	
	

}
