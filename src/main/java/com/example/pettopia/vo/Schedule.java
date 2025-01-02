package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Schedule {
	private Integer scheduleNo;
	private Integer empNo;
	private String scheduleTitle;
	private String scheduleContent;
	private String scheduleType;
	private String startDate;
	private String endDate;
}
