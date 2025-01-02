package com.example.pettopia.vo;

import lombok.Data;

@Data
public class VacationRecord {
	private Integer recordId;
	private Integer empNo;
	private Integer totalVacation;
	private Integer usedVacation;
	private Integer remainingVacation;
	private Integer updateDate;
}
