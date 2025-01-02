package com.example.pettopia.vo;

import lombok.Data;

@Data
public class BoardFile {
	private Integer boardFileNo;
	private Integer boardNo;
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDate;
	private String updateDate;
}
