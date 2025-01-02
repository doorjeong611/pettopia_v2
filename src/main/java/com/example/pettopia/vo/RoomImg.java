package com.example.pettopia.vo;

import lombok.Data;

@Data
public class RoomImg {
	private Integer roomImgNo;
	private Integer roomNo;
	private String originFileName;
	private String fileName;
	private String fileType;
	private String fileExt;
	private String createDate;
}
