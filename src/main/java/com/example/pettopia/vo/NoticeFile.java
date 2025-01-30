package com.example.pettopia.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NoticeFile {
	private Integer noticeFileNo; // PK
	private Integer noticeNo; // FK
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
	

}
	
