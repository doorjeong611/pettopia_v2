package com.example.pettopia.vo;

import lombok.Data;

@Data
public class BoardComment {
	private Integer commentNo;
	private Integer boardNo;
	private Integer commentWriterNo;
	private String commentContent;
	private String createDate;
	private String updateDate;
}
