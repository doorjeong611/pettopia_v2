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
	private Integer approverEmpNo;
	private String createDate;
	private String updateDate;
}
