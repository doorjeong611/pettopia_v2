package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Schedule {
	private Integer scheduleNo; // PK
	private Integer empNo; // FK
	private String scheduleTitle;
	private String scheduleContent;
	private String scheduleType;
	private String startDatetime;
	private String endDatetime;
	private String createDatetime;
	private String updateDatetime;
}
