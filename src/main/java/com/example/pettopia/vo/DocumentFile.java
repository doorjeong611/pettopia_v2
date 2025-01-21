package com.example.pettopia.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DocumentFile {
	private Integer docFileNo; // PK
	private Integer docNo; // FK
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private Long fileSize;
	private String createDatetime;
	private String updateDatetime;
	private List<MultipartFile> documentFile;
}
