package com.example.pettopia.vo;

import lombok.Data;

@Data
public class BoardFile {
	private Integer boardFileNo; // PK
	private Integer boardNo; // FK
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
