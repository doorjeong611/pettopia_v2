package com.example.pettopia.vo;

import lombok.Data;

@Data
public class MeetingRoomImg {
	private Integer roomImgNo;
	private Integer roomNo;
	private String originalFileName;
	private String fileName;
	private String fileType;
	private String fileExt;
	private String createDate;
}
