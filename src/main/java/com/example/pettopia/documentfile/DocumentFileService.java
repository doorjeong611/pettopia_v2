package com.example.pettopia.documentfile;

import java.io.File;
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
	
	
	// documentOne → removeDocumentFile : 파일 삭제 하기
	public Integer removeDocumentFile(Integer docFileNo, String path) {
		DocumentFile documentFile = documentFileMapper.selectDocumentFileOne(docFileNo);
		
		Integer removeDocumentFileRow = documentFileMapper.deleteDocumentFile(docFileNo);
		
		if(removeDocumentFileRow == 1) {
			String fullname = path + documentFile.getFileName() + "." + documentFile.getFileExt();
			File file = new File(fullname);
			file.delete();
		}
		return 1;
	}

}
