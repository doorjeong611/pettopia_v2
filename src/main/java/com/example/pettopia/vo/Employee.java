package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Employee {
	private Integer empNo;
	private String empName;
	private String empPw;
	private String empEmail;
	private String empBirth;
	private String empGender;
	private String empPhone;
	private Integer postalCode;
	private String basicAddress;
	private String detailAddress;
	private String empStatus;
	private String isTeamLeader;
	private String isFirstLogin;
	private Integer deptNo;
	private Integer rankNo;
	private String hiredate;
	private String resignationDate;
	private String createDatetime;
	private String updateDatetime;
}
