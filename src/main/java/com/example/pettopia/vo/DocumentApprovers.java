package com.example.pettopia.vo;

import lombok.Data;

@Data
public class DocumentApprovers {
	
	private Integer docApproversNo; // PK
	private Integer docNo; // FK 
	private String initApproverNo; // FK
	private String initApproverStatus;
	private String initApproverDatetime;
	private String initRejectReson;
	private String midApproverNo; // FK
	private String midApproverStatus;
	private String midApproverDatetime;
	private String midRejectReson;
	private String finalApproverNo; // FK
	private String finalApproverStatus;
	private String finalApproverDatetime;
	private String finalRejectReson;
	private String createDatetime;
	private String updateDatetime;
}
