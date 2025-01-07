package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Attendance {
	private String attendanceDate; // PK
	private String empNo; // PK
	private String attendanceStatus;
	private String clockInTime;
	private String clockOutTime;
	private String createDatetime;
	private String updateDatetime;
}
