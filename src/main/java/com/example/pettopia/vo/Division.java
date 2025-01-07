package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Division {
	private String divisionCode; // PK
	private String divisionName;
	private String createDatetime;
	private String updateDatetime;
}
