package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Board {
	private Integer boardNo;
	private String boardTitle;
	private Integer boardWriterNo;
	private Integer divisionNo;
	private String boardContent;
	private Integer boardLike;
	private Integer boardView;
	private String boardHeader;
	private String createDate;
	private String updateDatetime;
}
