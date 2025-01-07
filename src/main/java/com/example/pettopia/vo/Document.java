package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Document {
	private Integer docNo; // PK
	private String docTitle;
	private String docWriterNo; // FK
	private String docContent;
	private String docType;
	private String approvalStatus;
	private String docBin;
	private String approverEmpNo; // FK
	private String vacationType;
	private String vacationStartDate;
	private String vacationEndDate;
	private String materialList;
	private Integer materialQuantity;
	private String createDatetime;
	private String updateDatetime;
	
}
