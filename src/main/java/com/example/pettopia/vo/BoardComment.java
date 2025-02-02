package com.example.pettopia.vo;

import lombok.Data;

@Data
public class BoardComment {
	private Integer commentNo; // PK
	private Integer boardNo; // FK
	private String commentWriterNo; // FK
	private Integer parentCommentNo;
	private String commentContent;
	private String commentDepth;
	private String createDatetime;
	private String updateDatetime;
}
