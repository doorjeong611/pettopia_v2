package com.example.pettopia.vo;

import lombok.Data;

@Data
public class PetService {
	private Integer serviceNo; // PK
	private String serviceName;
	private String serviceDesc;
	private Integer servicePrice;
	private String serviceOption1;
	private String serviceOption2;
	private String createDatetime;
	private String updateDatetime;
}
