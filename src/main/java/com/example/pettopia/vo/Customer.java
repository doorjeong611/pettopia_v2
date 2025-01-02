package com.example.pettopia.vo;

import lombok.Data;

@Data
public class Customer {
	private Integer customerNo;
	private String customerName;
	private Integer addressNo;
	private String customerPhone;
	private String createDate;
	private String updateDate;
}
