package com.example.pettopia.vo;

import lombok.Data;

@Data
public class PetService {
	private Integer serviceNo;
	private String serviceName;
	private String serviceDescription;
	private Integer servicePrice;
	private String serviceOption1;
	private String serviceOption2;
	private String createDate;
	private String updateDate;
}
