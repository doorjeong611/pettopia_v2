package com.example.pettopia.document;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.util.Page;
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
	public Map<String, Object> getDocumentList(Page page, Map<String, Object> paramMap) {
		
		// 기본 설정
	    page.setRowPerPage(9);
	    Integer beginRow = page.getBeginRow();
	    Integer rowPerPage = page.getRowPerPage();

	    // paramMap에 값 추가
	    paramMap.put("beginRow", beginRow);
	    paramMap.put("rowPerPage", rowPerPage);
	    
	    // 필요한 파라미터 추가
	    paramMap.put("empNo", paramMap.get("empNo")); // 직원 번호
	    paramMap.put("docWriterNo", paramMap.get("docWriterNo")); // 작성자 번호
	    paramMap.put("initApproverNo", paramMap.get("initApproverNo")); // 초기 승인자 번호
	    paramMap.put("midApproverNo", paramMap.get("midApproverNo")); // 초기 승인자 번호
	    paramMap.put("finalApproverNo", paramMap.get("finalApproverNo")); // 초기 승인자 번호
	    paramMap.put("approvalStatus", paramMap.get("approvalStatus")); // 결재 상태
	    paramMap.put("searchWord", paramMap.get("searchWord")); // 검색어

	    // 문서 리스트 조회
	    List<Map<String, Object>> documentList = documentMapper.selectDocumentList(paramMap);
	    log.debug(TeamColor.KDH + "documentList : " + documentList.toString() + TeamColor.RESET); // debug

	    // 총 문서 수 조회
	    Integer totalCount = documentMapper.selectCountDocumentList(paramMap);
	    log.debug(TeamColor.KDH + "selectCountDocuments : " + totalCount + TeamColor.RESET); // debug

	    // 마지막 페이지 계산
	    Integer lastPage = totalCount / rowPerPage;
	    if (totalCount % rowPerPage != 0) {
	        lastPage++;
	    }

	    log.debug(TeamColor.KDH + "DocumentListLastPage : " + lastPage + TeamColor.RESET); // debug
	    page.setLastPage(lastPage);

	    // 결과를 맵에 담아 반환
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("documentList", documentList);
	    resultMap.put("page", page);

	    return resultMap;
	}
	
	// documentBin → 결재 문서 휴지통 조회
	public Map<String, Object> getDocumentBin(Page page, Map<String, Object> paramMap) {
		
		// 기본 설정
	    page.setRowPerPage(9);
	    Integer beginRow = page.getBeginRow();
	    Integer rowPerPage = page.getRowPerPage();

	    // paramMap에 값 추가
	    paramMap.put("beginRow", beginRow);
	    paramMap.put("rowPerPage", rowPerPage);
	    
	    // 필요한 파라미터 추가
	    paramMap.put("empNo", paramMap.get("empNo")); // 직원 번호
	    paramMap.put("docWriterNo", paramMap.get("docWriterNo")); // 작성자 번호
	    paramMap.put("initApproverNo", paramMap.get("initApproverNo")); // 초기 승인자 번호
	    paramMap.put("approvalStatus", paramMap.get("approvalStatus")); // 결재 상태
	    paramMap.put("searchWord", paramMap.get("searchWord")); // 검색어

	    // 문서 리스트 조회
	    List<Map<String, Object>> documentBin = documentMapper.selectDocumentBin(paramMap);
	    log.debug(TeamColor.KDH + "documentBin : " + documentBin.toString() + TeamColor.RESET); // debug

	    // 총 문서 수 조회
	    Integer totalCount = documentMapper.selectCountDocumentBin(paramMap);
	    log.debug(TeamColor.KDH + "selectCountDocumentBin : " + totalCount + TeamColor.RESET); // debug

	    // 마지막 페이지 계산
	    Integer lastPage = totalCount / rowPerPage;
	    if (totalCount % rowPerPage != 0) {
	        lastPage++;
	    }

	    log.debug(TeamColor.KDH + "DocumentBinListLastPage : " + lastPage + TeamColor.RESET); // debug
	    page.setLastPage(lastPage);

	    // 결과를 맵에 담아 반환
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("documentBin", documentBin);
	    resultMap.put("page", page);

	    return resultMap;
	}
	
	// documentBin → 문서 보관함에서 휴지통으로 or 휴지통에서 보관함으로 복원 
	public void modifyDocumentBin(Integer docNo) {
		documentMapper.updateDocumentBin(docNo);
	}
	
	// documentBin → 문서 영구삭제
	public void removeDocument(Integer docNo) {
		documentMapper.deleteDocument(docNo);
	}
	
	

}
