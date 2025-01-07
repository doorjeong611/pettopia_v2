package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Customer {
	private Integer customerNo; // PK
	private String customerName;
	private String postalCode;
	private String basicAddress;
	private String detailAddress;
	private String customerPhone;
	private String createDatetime;
	private String updateDatetime;
	
}
