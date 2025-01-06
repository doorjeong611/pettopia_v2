package com.example.pettopia.vo;

import lombok.Data;

@Data
public class PetServiceRsv {
	private Integer rsvNo; // PK
	private Integer customerNo; // FK
	private Integer serviceNo; // FK
	private String rsvDatetime;
	private String rsvStatus;
	private String rsvNoShow;
	private String createDatetime;
	private String updateDatetime;
}
