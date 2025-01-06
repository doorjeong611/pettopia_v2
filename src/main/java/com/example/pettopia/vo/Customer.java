package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Customer {
	private Integer customerNo;
	private String customerName;
	private Integer postalCode;
	private String basicAddress;
	private String detailAddress;
	private String customerPhone;
	private String createDatetime;
	private String updateDatetime;
	
}
