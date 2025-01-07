package com.example.pettopia.vo;

import lombok.Data;

@Data
public class VacationRecord {
	private Integer recordNo; // PK
	private String empNo; // FK
	private Integer totalVacation;
	private String createDatetime;
	private String updateDatetime;
}
