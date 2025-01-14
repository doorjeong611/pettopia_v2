package com.example.pettopia.vo;


import lombok.Data;

@Data
public class RoomInfo {
	private Integer roomNo; // PK
	private String roomName;
	private String roomType;
	private Integer roomCapacity;
	private Integer pricePerNight;
	private String roomDesc;
	private String createDatetime;
	private String updateDatetime;
}
