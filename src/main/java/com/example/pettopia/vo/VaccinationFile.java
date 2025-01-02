package com.example.pettopia.vo;

import lombok.Data;

@Data
public class VaccinationFile {
	private Integer vaccinationFileNo;
	private Integer rsvNo;
	private String originFileName;
	private String fileName;
	private String fileType;
	private String fileExt;
	private String createDate;
}
