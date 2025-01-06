package com.example.pettopia.vo;

import lombok.Data;

@Data
public class EmployeeFile {
	private Integer employeeFileNo;
	private Integer empNo;
	private String filePurpose;
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
