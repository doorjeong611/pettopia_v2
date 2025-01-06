package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Attendance {
	private String attendanceDate;
	private Integer empNo;
	private String attendance_status;
	private String clockInTime;
	private String clockOutTime;
	private String createDatetime;
	private String updateDatetime;
}
