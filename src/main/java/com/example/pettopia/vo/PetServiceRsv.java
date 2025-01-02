package com.example.pettopia.vo;

import lombok.Data;

@Data
public class PetServiceRsv {
	private Integer rsvNo;
	private Integer customerNo;
	private Integer serviceNo;
	private String rsvDate;
	private String rsvStatus;
	private String createDate;
	private String updateDate;
}
