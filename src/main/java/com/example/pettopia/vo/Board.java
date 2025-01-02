package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Board {
	private Integer boardNo;
	private String boardTitle;
	private Integer boardWriterNo;
	private String board_Content;
	private Integer boardLike;
	private Integer boardView;
	private String createDate;
	private String updateDate;
}
