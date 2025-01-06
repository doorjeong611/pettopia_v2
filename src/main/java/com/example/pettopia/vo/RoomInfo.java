package com.example.pettopia.vo;

import lombok.Data;

@Data
public class RoomInfo {
	private Integer roomNo;
	private String roomName;
	private String roomType;
	private Integer roomCapacity;
	private Integer pricePerNight;
	private String roomDescription;
	private String createDatetime;
	private String updateDatetime;
}
