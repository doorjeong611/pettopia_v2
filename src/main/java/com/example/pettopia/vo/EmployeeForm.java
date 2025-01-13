package com.example.pettopia.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeForm {// 직원 등록 폼에 맞춰진 vo
	
	private String empNo;
	private String empPw;
	private String empName;
	private String empEmail;
	private String empBirth;
	private String empGender;
	private String empPhoneF;
	private String empPhoneM;
	private String empPhoneL;
	private String postalCode;
	private String basicAddress;
	private String detailAddress;
	private String dong;
	private String deptCode;
	private Integer rankNo;
	private String hireDate;
	private MultipartFile employeeFile;
	
	
	
	
	

}
