package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Attendance {
	private String attendanceDate;
	private Integer empNo;
	private String startTime;
	private String endTime;
	private String attendanceStatus;
}
