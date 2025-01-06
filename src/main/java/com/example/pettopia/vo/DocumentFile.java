package com.example.pettopia.vo;

import lombok.Data;

@Data
public class DocumentFile {
	private Integer docFileNo;
	private Integer docNo;
	private String originalFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
