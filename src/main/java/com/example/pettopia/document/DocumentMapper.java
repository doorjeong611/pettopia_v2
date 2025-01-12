package com.example.pettopia.document;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

}
