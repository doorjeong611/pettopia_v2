package com.example.pettopia.vo;

import lombok.Data;

@Data
public class PetServiceRsv {
	private Integer rsvNo;
	private Integer customerNo;
	private Integer serviceNo;
	private String rsvDatetime;
	private String rsvStatus;
	private String rsvNoShow;
	private String createDatetime;
	private String updateDatetime;
}
