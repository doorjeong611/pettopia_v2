package com.example.pettopia.document;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Department;
import com.example.pettopia.vo.Division;
import com.example.pettopia.vo.Document;
import com.example.pettopia.vo.DocumentApprovers;

@Mapper
public interface DocumentMapper {
	
	// addDocument → 문서 작성
	Integer insertDocument(Document document);
	
	// addDocument → 문서 작성할 때 작성자 직원 부서 조회
	Map<String, Object> selectEmployeeDept(String empNo);
	
	// addDocument → 문서 작성할 때 결재자 지정
	Integer insertDocumentApprovers(DocumentApprovers documentApprovers);
	
	// addDocument → 결재자 지정할 때 상위 부서 조회
	List<Division> selectDivisionListByDocument();
	
	// addDocument → 결재자 지정할 때 팀 조회
	List<Department> selectDeptListByDocument(String divisionCode);
	
	// addDocument → 결재자 지정할 때 직원 조회
	List<Map<String, Object>> selectEmpListByDocument(String deptCode);
	
	// addDocument → 결재자 지정할 때 직원 검색
	List<Map<String, Object>> selectEmpSearchByDocument(String empName);
	
	// documentList → 문서 리스트 조회
	List<Map<String, Object>> selectDocumentList(String empNo, String docType);

}
