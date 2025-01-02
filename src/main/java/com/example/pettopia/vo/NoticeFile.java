package com.example.pettopia.vo;

import lombok.Data;

@Data
public class NoticeFile {
	private Integer noticeFileNo;
	private Integer noticeNo;
	private String originalFileName;
	private String fileName;
	private String fileType;
	private String fileExt;
	private String createDate;
	private String updateDate;
}
