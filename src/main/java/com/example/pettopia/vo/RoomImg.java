package com.example.pettopia.vo;

import lombok.Data;

@Data
public class RoomImg {
	private Integer roomImgNo; // PK
	private Integer roomNo; // FK
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
