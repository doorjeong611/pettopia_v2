package com.example.pettopia.vo;

import lombok.Data;

@Data
public class RoomRsv {
	private Integer rsvNo;
	private Integer roomNo;
	private Integer customerNo;
	private String checkInDate;
	private String checkOutDate;
}