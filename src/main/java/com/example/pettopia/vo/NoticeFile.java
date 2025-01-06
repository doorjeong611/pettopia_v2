package com.example.pettopia.vo;

import lombok.Data;

@Data
public class NoticeFile {
	private Integer noticeFileNo;
	private Integer noticeNo;
	private String originalFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
