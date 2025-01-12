package com.example.pettopia.document;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.util.TeamColor;
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
	

}
