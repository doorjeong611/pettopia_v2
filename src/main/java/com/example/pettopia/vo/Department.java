package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Department {
	private Integer deptNo; // PK
	private Integer divisionNo; // FK
	private String deptName;
	private String deptExt;
	private String createDatetime;
	private String updateDatetime;
}
