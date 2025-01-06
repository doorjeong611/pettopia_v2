package com.example.pettopia.vo;

import lombok.Data;

@Data
public class VacationRecord {
	private Integer recordNo; // PK
	private Integer empNo; // FK
	private Integer totalVacation;
	private Integer createDatetime;
	private Integer updateDatetime;
}
