package com.example.pettopia.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Employee implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String empNo; // PK
	private String empName;
	private String empPw;
	private String empEmail;
	private String empBirth;
	private String empGender;
	private String empPhone;
	private String postalCode;
	private String basicAddress;
	private String detailAddress;
	private String empStatus;
	private String isTeamLeader;
	private String deptCode; // FK
	private Integer rankNo; // FK
	private String roleName;
	private String hireDate;
	private String resignationDate;
	private String createDatetime;
	private String updateDatetime;
	
}
