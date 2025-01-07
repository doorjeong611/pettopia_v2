package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Board {
	private Integer boardNo; // PK
	private String boardTitle;
 	private String boardWriterNo; // FK
	private String divisionCode;
	private String boardContent;
	private Integer boardLike;
	private Integer boardView;
	private String boardHeader;
	private String createDatetime;
	private String updateDatetime;
}
