package com.example.pettopia.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	private List<MultipartFile> files = new ArrayList<>(); // 첨부파일 List 추가
}
