package com.example.pettopia.documentfile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.DocumentFile;

@Mapper
public interface DocumentFileMapper {
	
	// addDocument → addDocumentFile : 문서 작성 시 문서 파일 추가
	Integer insertDocumentFile(DocumentFile documentFile);
	
	// documentOne → 문서 수정할 때 파일 삭제 시 파일 정보 조회
	DocumentFile selectDocumentFileOne(Integer docFileNo);
	
	// documentOne → 문서 파일 삭제
	Integer deleteDocumentFile(Integer docFileNo);
	
	// documentOne : 파일 리스트 조회
	List<DocumentFile> selectDocumentFileList(Integer docFileNo);

}	
