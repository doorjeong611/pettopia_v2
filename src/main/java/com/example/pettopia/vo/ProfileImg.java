package com.example.pettopia.vo;

import lombok.Data;

@Data
public class ProfileImg {
	private Integer profileImgNo;
	private Integer empNo;
	private String originalFileName;
	private String fileName;
	private String fileType;
	private String fileExt;
	private String createDate;
	private String updateDate;
}
