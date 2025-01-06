package com.example.pettopia.vo;

import lombok.Data;

@Data
public class VaccinationFile {
	private Integer vaccinationFileNo; // PK
	private Integer rsvNo; // FK
	private String originFileName;
	private String fileName;
	private String fileExt;
	private String fileType;
	private String createDatetime;
	private String updateDatetime;
}
 