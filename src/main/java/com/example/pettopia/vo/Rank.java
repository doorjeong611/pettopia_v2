package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Rank {
	private Integer rankNo; // PK
	private String rankName;
	private String createDatetime;
	private String updateDatetime;
}
