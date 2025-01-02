package com.example.pettopia.vo;

import lombok.Data;

@Data
public class VacationDocument {
	private Integer vacationNo;
	private Integer empNo;
	private Integer docNo;
	private String vacationType;
	private String startDate;
	private String endDate;
}
