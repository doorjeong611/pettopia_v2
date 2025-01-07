package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Department {
	private String deptCode; // PK
	private String divisionCode; // FK
	private String deptName;
	private String deptExt;
	private String createDatetime;
	private String updateDatetime;
}
