package com.example.pettopia.vo;

import lombok.Data;

@Data
public class DocumentFile {
	private Integer docFileNo; // PK
	private Integer docNo; // FK
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
