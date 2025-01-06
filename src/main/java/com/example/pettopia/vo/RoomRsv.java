package com.example.pettopia.vo;

import lombok.Data;

@Data
public class RoomRsv {
	private Integer rsvNo; // PK
	private Integer roomNo; // FK
	private Integer customerNo;
	private String checkInDatetime;
	private String checkOutDatetime;
	private String rsvStatus;
	private String createDatetime;
	private String updateDatetime;
}