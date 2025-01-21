package com.example.pettopia.documentfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.pettopia.vo.DocumentFile;

@Service
@Transactional
public class DocumentFileService {
	
	@Autowired DocumentFileMapper documentFileMapper;
	
	// getDocumentOne : documentFileList 조회
	public List<DocumentFile> getDocumentFileList(Integer docNo){
		return documentFileMapper.selectDocumentFileList(docNo);
	}

}
