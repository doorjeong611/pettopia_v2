package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Notice {
	private Integer noticeNo; // PK
	private Integer writerEmpNo; // FK
	private Integer deptNo; // PK
	private String noticeTitle;
	private String noticeContent;
	private Integer noticeView;
	private String isPinned;
	private String createDatetime;
	private String updateDatetime;
}
