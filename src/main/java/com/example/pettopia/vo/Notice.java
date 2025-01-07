package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Notice {
	private Integer noticeNo; // PK
	private String writerEmpNo; // FK
	private String deptCode; // PK
	private String noticeTitle;
	private String noticeContent;
	private Integer noticeView;
	private String isPinned;
	private String createDatetime;
	private String updateDatetime;
}
