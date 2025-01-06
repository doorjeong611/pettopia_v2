package com.example.pettopia.vo;

import lombok.Data;

@Data
public class BoardComment {
	private Integer commentNo; // PK
	private Integer boardNo; // FK
	private Integer commentWriterNo; // FK
	private String commentContent;
	private String commentDepth;
	private String createDatetime;
	private String updateDatetime;
}
