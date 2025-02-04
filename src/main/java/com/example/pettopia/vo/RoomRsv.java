package com.example.pettopia.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RoomRsv {
	private Integer rsvNo; // PK
	private Integer roomNo; // FK
	private Integer customerNo; // FK
	private LocalDateTime checkInDatetime;
	private LocalDateTime checkOutDatetime;
	private String rsvStatus;
	private LocalDateTime createDatetime;
	private LocalDateTime updateDatetime;
}