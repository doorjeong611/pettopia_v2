package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Document {
	private Integer docNo;
	private String docTitle;
	private Integer docWriterNo;
	private String docContent;
	private String docType;
	private String approvalStatus;
	private String docBin;
	private Integer approverEmpNo;
	private String vacationType;
	private String vacationStartDate;
	private String vacationEndDate;
	private String materialList;
	private Integer materialQuantity;
	private String createDatetime;
	private String updateDatetime;
	
}
