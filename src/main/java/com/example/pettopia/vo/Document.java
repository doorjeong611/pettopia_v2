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
	private String docPurpose;
	private Integer docPrice;
	private String docRemarks;
	private String vacationType;
	private String vacationBackup; // FK
	private String materialName;
	private Integer materialQuantity;
	private String resignationType;
	private String startDate;
	private String endDate;
	private String createDatetime;
	private String updateDatetime;
	
}
