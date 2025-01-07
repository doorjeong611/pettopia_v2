package com.example.pettopia.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Document;

@Mapper
public interface DocumentMapper {
	
	// addDocument : 문서 작성
	Integer insertDocument(Document document);

}
