package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Address {
	private Integer addressNo;
	private Integer empNo;
	private String postalCode;
	private String basicAddress;
	private String detailedAddress;
	private String createDate;
	private String updateDate;
}
